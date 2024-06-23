import React from 'react';
import styles from './App.module.css';
type ButtonProps = {
    title: string;
    onClick: () => void;
    disabled?: boolean;
};
const Button: React.FC<ButtonProps> = ({ title, onClick, disabled }) => {
    return (
        <button className={styles.button} onClick={onClick} disabled={disabled}>
            {title}
        </button>
    );
};
export default Button;