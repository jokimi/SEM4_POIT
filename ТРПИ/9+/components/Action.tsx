import React from 'react';
type ActionProps = {
    action: string,
    onClickAction: () => void
};


export const Action = (props: ActionProps) => {
    return (
        <div className={
            props.action === 'undo' ? "status__action-undo"
                : props.action === 'erase' ? "status__action-erase"
                : props.action === 'hint' ? "status__action-hint"
                : ""
            }
            onClick = {props.onClickAction}>
                <p className="status__action-text">
                {
                    props.action === 'undo' ? 'Проверить'
                        : props.action === 'erase' ? 'Удалить'
                        : props.action === 'hint' ? 'Подсказка'
                        : ''
                }
                </p>
        </div>
    )
}