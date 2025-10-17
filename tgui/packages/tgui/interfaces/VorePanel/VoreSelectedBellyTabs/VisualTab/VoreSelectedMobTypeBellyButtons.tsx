import { LabeledList } from 'tgui-core/components';

import type { siliconeBellyControls } from '../../types';

export const VoreSelectedMobTypeBellyButtons = (props: {
  editMode: boolean;
  bellyControl: siliconeBellyControls;
}) => {
  const { editMode, bellyControl } = props;
  const {
    silicon_belly_overlay_preference,
    belly_sprite_option_shown,
    belly_sprite_to_affect,
  } = bellyControl;


  {
    return (
      // Returning Empty element
      <LabeledList>
        <LabeledList.Item />
      </LabeledList>
    );
  }
};
