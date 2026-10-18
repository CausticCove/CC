import { useBackendStrict } from 'tgui/backend';
import { Button, LabeledList, Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';
import {
  LabeledGridList,
  LabeledListLikeTooltip,
} from 'pm/components';

export const SubtabIdentityDownstreamPaneLeft = () => {
  // Suggested format:
  // return (
  //   <>
  //     <Stack.Item>
  //       <MyCardHere />
  //     </Stack.Item>
  //     <Stack.Item>
  //       <MyCardHere2 />
  //     </Stack.Item>
  //   </>
  // )

  return (
    <>
      <Stack.Item>
        <Nobility />
      </Stack.Item>
      <Stack.Item>
        <CharacterDirectory />
      </Stack.Item>
    </>
  );
};

export const SubtabIdentityDownstreamPaneRight = () => {
  // Suggested format:
  // return (
  //   <>
  //     <Stack.Item>
  //       <MyCardHere />
  //     </Stack.Item>
  //     <Stack.Item>
  //       <MyCardHere2 />
  //     </Stack.Item>
  //   </>
  // )

  return null;
};

type NobilityData = {
  manor_name: string;
  manor_type: string;
};

const Nobility = () => {
  const { act, data } = useBackendStrict<NobilityData>();
  const {
    manor_name,
    manor_type,
  } = data;

  return (
    <Section fill title={
            <LabeledListLikeTooltip
              tooltip="Manors are granted to Keep roles that require nobility. You can assign a name and a type to your manor here. To access them ingame, visit any Hermes, insert a copper into it, and interact with the UI."
              tooltipPosition="bottom-start"
            >
              Nobility Manors
            </LabeledListLikeTooltip>
          }>
      <LabeledGridList>
        <LabeledGridList.Item label="Name">
          <Button
            fluid
            onClick={() => act('manor_name')}
          >
            {manor_name}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="Type">
          <Button
            fluid
            onClick={() => act('manor_type')}
          >
            {manor_type}
          </Button>
        </LabeledGridList.Item>
      </LabeledGridList>
    </Section>
  );
};

type DirectoryData = {
  show_in_directory: BooleanLike;
  directory_tag: string;
  directory_erptag: string;
  directory_gendertag: string;
  directory_sexualitytag: string;
  rp_guidance: number;
};

const CharacterDirectory = () => {
  const { act, data } = useBackendStrict<DirectoryData>();
  const {
    show_in_directory,
    directory_tag,
    directory_erptag,
    directory_gendertag,
    directory_sexualitytag,
    rp_guidance,
  } = data;

  return (
    <Section fill title="Character Directory">
      <LabeledGridList>
        <LabeledGridList.Item label="Visibility">
          <Button
            fluid
            onClick={() => act('show_in_directory')}
          >
            {show_in_directory ? 'Shown' : 'Not Shown'}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="Gender">
          <Button
            fluid
            onClick={() => act('directory_gendertag')}
          >
            {directory_gendertag}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="Sexuality">
          <Button
            fluid
            onClick={() => act('directory_sexualitytag')}
          >
            {directory_sexualitytag}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="ERP Tag">
          <Button
            fluid
            onClick={() => act('directory_erptag')}
          >
            {directory_erptag}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="Vore Tag">
          <Button
            fluid
            onClick={() => act('directory_tag')}
          >
            {directory_tag}
          </Button>
        </LabeledGridList.Item>
        <LabeledGridList.Item label="RP Guidance">
          <Button
            fluid
            onClick={() => act('rp_guidance')}
          >
            {rp_guidance === 0 ? 'Alternatives Preferred' : rp_guidance === 3 ? 'Neutral' : rp_guidance === 1 ? 'Mechanics Willing' : 'Mech. Willing & Hunted Trait'}
          </Button>
        </LabeledGridList.Item>
      </LabeledGridList>
    </Section>
  );
};
