import React, { useState } from 'react';
import styles from './App.module.css';
import Button from './Button';

const Counter: React.FC = () => {
    const [count, setCount] = useState(0);
    const increaseCount = () => {
        if (count < 5) {
            setCount(count + 1);
        }
    };
    const resetCount = () => {
        setCount(0);
    };

    const countClassName = count === 5 ? styles.redCount : styles.count;
    return (
        <div className={styles.counter}>
            <p className={countClassName}>{count}</p>
            <Button title="Increase" onClick={increaseCount} disabled={count === 5} />
            <Button title="Reset" onClick={resetCount} disabled={count === 0} />
        </div>
    );
};
export default Counter;