import React from 'react';
type HeaderProps = {
  onClick: () => void
};
export const Header = (props: HeaderProps) => {
  return (
    <header className="header">
      <h2 onClick={props.onClick}>
        Новая игра
      </h2>
    </header>
  )
}