import { useMemo, useState } from 'react';
import {
  Button,
  Collapsible,
  Input,
  LabeledList,
  Stack,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const Supplies = (props, context) => {
  const { act, data } = useBackend();
  const [supply_mails] = useState(data.supplymails);

  return(
    <Window title='Supplies' width={340} height={600} resizeable>
      <Window.Content scrollable>
        <Stack horizontal>
          <Stack vertical>
            {
              data["favours"]
            }
          </Stack>
          <Stack vertical>
            {JSON.stringify(data, null, 2)}
          </Stack>
        </Stack>
      </Window.Content>
    </Window>
  );
}
