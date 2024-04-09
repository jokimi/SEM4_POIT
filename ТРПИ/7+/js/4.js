const myPromise = new Promise((resolve, reject) => {
    resolve(21);
});
myPromise
    .then((result) => {
        console.log(result);
        return result * 2;
    })
    .then((result) => {
        console.log(result);
    });