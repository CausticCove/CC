import { PrefPopupGuard } from 'pm/components';
import { type ConstantData, useConstantPrefs } from 'pm/constant_data';
import type { Path } from 'pm/data';
import { type PopupData, registerPopup, usePopupBackend } from 'pm/popups';
import { Box, ImageButton, Stack } from 'tgui-core/components';
/**
 * Character Selection
 */
export type StatpackData = {
  current_statpack: Path;
} & PopupData;

const PopupStatpack = (props) => {
  const [constantData] = useConstantPrefs();
  const { data } = usePopupBackend<StatpackData>();
  const { popup_data_ready } = data;

  return (
    <PrefPopupGuard
      title="Selecting Statpack"
      loadingScreenText="Statpacks Loading..."
      width="80vw"
      height="80vh"
      dependencies={[constantData, popup_data_ready]}
    >
      <PopupStatpackInner constantData={constantData!} />
    </PrefPopupGuard>
  );
};

// Register it
declare module 'pm/popups' {
  interface PopupRegistry {
    Statpack: 'statpack';
  }
}
registerPopup('Statpack', 'statpack', PopupStatpack);

export const PopupStatpackInner = (props: { constantData: ConstantData }) => {
  const { constantData } = props;
  const { act, data } = usePopupBackend<StatpackData>();
  const { statpacks: constantStatpacks } = constantData;
  const { current_statpack } = data;

  const statpacks = Object.entries(constantStatpacks)
    .map(([path, val]) => ({ path, ...val }))
    .sort((a, b) => a.name.localeCompare(b.name));

  return (
    <Stack fill vertical m={2}>
      {statpacks.map((pack) => (
        <Stack.Item key={pack.path}>
          <ImageButton
            fluid
            fallbackIcon={pack.icon}
            selected={pack.path === current_statpack}
            onClick={() => {
              act('statpack', { statpack: pack.path });
            }}
          >
            <Stack align="center" justify="space-around">
              <Stack.Item fontSize={1.2}>{pack.name}</Stack.Item>
              <Stack.Item basis="70%">
                <Box dangerouslySetInnerHTML={{ __html: pack.desc }} />
              </Stack.Item>
            </Stack>
          </ImageButton>
        </Stack.Item>
      ))}
      {/* extra little space at the bottom just for scrolling pleasure */}
      <Stack.Item>
        <Box height={2} />
      </Stack.Item>
    </Stack>
  );
};
