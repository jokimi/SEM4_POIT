import React from 'react';
import { Numbers } from '../Numbers';
import { Action } from '../Action';

type StatusSectionProps = {
  onClickNumber: (number: string) => void,
  onClickErase: () => void,
  onClickHint: () => void,
  onClickCheck: () => void
};

export const StatusSection = (props: StatusSectionProps) => {
  return (
    <section className="status">
      <Numbers onClickNumber={(number) => props.onClickNumber(number)} />
      <div className="status__actions">
        <Action action='erase' onClickAction={props.onClickErase} />
        <Action action='hint' onClickAction={props.onClickHint} />
        <Action action='undo' onClickAction={props.onClickCheck} />
      </div>
    </section>
  )
}