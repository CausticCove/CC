import type { CSSProperties } from 'react';

import { formatPct, withPct } from '../common/format';
import {
  INK,
  INK_FAINT,
  SEAL_AMBER,
  SEAL_GREEN,
  SEAL_RED,
} from '../common/parchment';
import { SummarySegment } from '../common/SummarySegment';
import {
  columnSubheadStyle,
  compactCardStyle,
  compactDataCell,
  compactHeaderCell,
  dividedTwoColumnLayout,
  Tally,
  twoColTable,
  verticalDividerStyle,
} from './styles';
import type {
  ContractsSnapshot,
  ContractTypeRow,
  RoyalFavorsSnapshot,
} from './types';

type Props = {
  c: ContractsSnapshot;
  rf: RoyalFavorsSnapshot;
};

const LOW_TAKE_RATE = 10;
const LOW_TAKE_MIN_POSTED = 5;

const pct = (part: number, whole: number) =>
  whole > 0 ? Math.round((part / whole) * 100) : null;

const openCount = (row: ContractTypeRow) =>
  Math.max(
    0,
    row.taken - row.completed - row.failed - row.abandoned - row.withdrawn,
  );

const numHead: CSSProperties = { ...compactHeaderCell, textAlign: 'right' };
const numCell: CSSProperties = { ...compactDataCell, textAlign: 'right' };
const groupEdge: CSSProperties = {
  borderLeft: `1px dotted ${INK_FAINT}`,
  paddingLeft: '6px',
};
const totalRow: CSSProperties = {
  borderTop: `1px solid ${INK_FAINT}`,
  fontWeight: 'bold',
};

const sumTypes = (rows: ContractTypeRow[]): ContractTypeRow =>
  rows.reduce(
    (acc, r) => ({
      name: 'All contracts',
      posted: acc.posted + r.posted,
      taken: acc.taken + r.taken,
      players: acc.players,
      completed: acc.completed + r.completed,
      failed: acc.failed + r.failed,
      abandoned: acc.abandoned + r.abandoned,
      withdrawn: acc.withdrawn + r.withdrawn,
      paid: acc.paid + r.paid,
    }),
    {
      name: 'All contracts',
      posted: 0,
      taken: 0,
      players: 0,
      completed: 0,
      failed: 0,
      abandoned: 0,
      withdrawn: 0,
      paid: 0,
    },
  );

const Headline = (props: Props & { total: ContractTypeRow }) => {
  const { c, rf, total } = props;
  return (
    <div style={compactCardStyle}>
      <SummarySegment
        title="Guild Contracts &amp; Royal Favors"
        items={[
          { label: 'Posted', value: total.posted },
          { label: 'Taken', value: total.taken },
          {
            label: 'Completed',
            value: withPct(total.completed, pct(total.completed, total.taken)),
            color: SEAL_GREEN,
          },
          { label: 'Players', value: c.players_total },
          { label: 'Rewards', value: `${total.paid}m` },
        ]}
      />
      <div style={dividedTwoColumnLayout}>
        <div>
          <div style={columnSubheadStyle}>Mammons</div>
          <Tally
            items={[
              { label: 'Ledger take-home', value: `${c.mammons_paid}m` },
              { label: 'Crown levy', value: `${c.mammons_taxed}m` },
              { label: 'Guild cut', value: `${c.guild_cut}m` },
              { label: 'Forfeited', value: `${c.mammons_forfeited}m` },
              { label: 'Refunded', value: `${c.mammons_refunded}m` },
              { label: 'Rerolled', value: c.rerolled },
            ]}
          />
        </div>
        <div style={verticalDividerStyle} />
        <div>
          <div style={columnSubheadStyle}>Royal Favors</div>
          <Tally
            items={[
              { label: 'Pledge raised', value: rf.pledge_generated },
              { label: 'Rumor raised', value: rf.rumor_generated },
              { label: 'Pledge spent', value: rf.pledge_consumed },
              { label: 'Rumor spent', value: rf.rumor_consumed },
              { label: 'Pledge unused', value: rf.pledge_unused },
              { label: 'Rumor unused', value: rf.rumor_unused },
            ]}
          />
        </div>
      </div>
    </div>
  );
};

type SourceRow = {
  label: string;
  posted: number;
  taken: number;
  completed: number;
  lapsed: number;
};

const SourceTable = (props: { c: ContractsSnapshot }) => {
  const { c } = props;
  const rows: SourceRow[] = [
    {
      label: 'Guild board',
      posted: c.generated_pool,
      taken: c.taken_pool,
      completed: c.completed_pool,
      lapsed: c.lapsed_pool,
    },
    {
      label: 'Tavern rumor',
      posted: c.generated_rumor,
      taken: c.taken_rumor,
      completed: c.completed_rumor,
      lapsed: c.lapsed_rumor,
    },
    {
      label: 'Crown commission',
      posted: c.generated_defense,
      taken: c.taken_defense,
      completed: c.completed_defense,
      lapsed: c.lapsed_defense,
    },
  ];
  return (
    <div style={compactCardStyle}>
      <SummarySegment title="By Commission" items={[]} />
      <table style={twoColTable}>
        <thead>
          <tr>
            <td style={compactHeaderCell}>Source</td>
            <td style={numHead}>Posted</td>
            <td style={numHead}>Taken</td>
            <td style={numHead}>Take %</td>
            <td style={{ ...numHead, ...groupEdge }}>Done</td>
            <td style={numHead}>Done %</td>
            <td style={{ ...numHead, paddingRight: 0 }}>Lapsed</td>
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr key={row.label}>
              <td style={compactDataCell}>{row.label}</td>
              <td style={numCell}>{row.posted}</td>
              <td style={numCell}>{row.taken}</td>
              <td style={numCell}>{formatPct(pct(row.taken, row.posted))}</td>
              <td style={{ ...numCell, ...groupEdge, color: SEAL_GREEN }}>
                {row.completed}
              </td>
              <td style={numCell}>
                {formatPct(pct(row.completed, row.taken))}
              </td>
              <td
                style={{
                  ...numCell,
                  paddingRight: 0,
                  color: row.lapsed > 0 ? SEAL_AMBER : INK,
                }}
              >
                {row.lapsed}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

const TypeRow = (props: { row: ContractTypeRow; style?: CSSProperties }) => {
  const { row } = props;
  const idle = row.posted === 0 && row.taken === 0;
  const takeRate = pct(row.taken, row.posted);
  const lowTake =
    row.posted >= LOW_TAKE_MIN_POSTED &&
    takeRate !== null &&
    takeRate < LOW_TAKE_RATE;
  const rowStyle: CSSProperties = {
    ...props.style,
    color: idle ? INK_FAINT : undefined,
  };
  const cell = (extra?: CSSProperties): CSSProperties => ({
    ...numCell,
    ...(idle ? { color: INK_FAINT } : {}),
    ...extra,
  });
  return (
    <tr style={rowStyle}>
      <td style={{ ...compactDataCell, ...(idle ? { color: INK_FAINT } : {}) }}>
        {row.name}
      </td>
      <td style={cell()}>{row.posted}</td>
      <td style={cell()}>{row.taken}</td>
      <td style={cell(lowTake ? { color: SEAL_RED } : undefined)}>
        {formatPct(takeRate)}
      </td>
      <td style={cell()}>{row.players}</td>
      <td style={cell({ ...groupEdge, ...(idle ? {} : { color: SEAL_GREEN }) })}>
        {row.completed}
      </td>
      <td style={cell(row.failed > 0 ? { color: SEAL_RED } : undefined)}>
        {row.failed}
      </td>
      <td style={cell()}>{row.abandoned}</td>
      <td style={cell()}>{row.withdrawn}</td>
      <td style={cell()}>{openCount(row)}</td>
      <td style={cell()}>{formatPct(pct(row.completed, row.taken))}</td>
      <td style={cell({ ...groupEdge, paddingRight: 0 })}>{row.paid}m</td>
    </tr>
  );
};

const TypeTable = (props: {
  rows: ContractTypeRow[];
  total: ContractTypeRow;
}) => (
  <div style={compactCardStyle}>
    <SummarySegment title="By Contract Type" items={[]} />
    <table style={twoColTable}>
      <thead>
        <tr>
          <td style={compactHeaderCell} />
          <td style={numHead} colSpan={4}>
            Uptake
          </td>
          <td style={{ ...numHead, ...groupEdge }} colSpan={6}>
            Outcome
          </td>
          <td style={{ ...numHead, ...groupEdge, paddingRight: 0 }} />
        </tr>
        <tr>
          <td style={compactHeaderCell}>Contract</td>
          <td style={numHead}>Posted</td>
          <td style={numHead}>Taken</td>
          <td style={numHead}>Take %</td>
          <td style={numHead}>Players</td>
          <td style={{ ...numHead, ...groupEdge }}>Done</td>
          <td style={numHead}>Failed</td>
          <td style={numHead}>Aband.</td>
          <td style={numHead}>Withdr.</td>
          <td style={numHead}>Open</td>
          <td style={numHead}>Done %</td>
          <td style={{ ...numHead, ...groupEdge, paddingRight: 0 }}>
            Rewards
          </td>
        </tr>
      </thead>
      <tbody>
        {props.rows.map((row) => (
          <TypeRow key={row.name} row={row} />
        ))}
        <TypeRow row={props.total} style={totalRow} />
      </tbody>
    </table>
  </div>
);

export const ContractsSection = (props: Props) => {
  const rows = props.c.types || [];
  const total = { ...sumTypes(rows), players: props.c.players_total };
  return (
    <>
      <Headline c={props.c} rf={props.rf} total={total} />
      <SourceTable c={props.c} />
      <TypeTable rows={rows} total={total} />
    </>
  );
};
