function genWithDelay(delay) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const randomNumber = Math.random();
            resolve(randomNumber);
        }, delay);
    });
}
const promises = [
    genWithDelay(1000),
    genWithDelay(2000),
    genWithDelay(3000)
];
Promise.all(promises)
    .then((results) => {
        console.log(results);
    })
    .catch((error) => {
        console.log(error);
    });