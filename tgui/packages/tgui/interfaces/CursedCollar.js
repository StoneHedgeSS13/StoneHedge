import { useBackend } from '../backend';
import { Button, Section } from '../components';
import { Window } from '../layouts';

export const CursedCollar = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    victim_name,
    listening,
  } = data;
  return (
    <Window
      width={300}
      height={300}>
      <Window.Content>
        <Section title="Collar Control">
          <Button
            icon="eye"
            content="Scry Vision"
            onClick={() => act('scry')} />
          <Button
            icon="ear"
            content={listening ? 'Stop Listening' : 'Listen'}
            selected={listening}
            onClick={() => act('listen')} />
          <Button
            icon="bolt"
            content="Shock Victim"
            color="bad"
            onClick={() => act('shock')} />
        </Section>
      </Window.Content>
    </Window>
  );
}; 
