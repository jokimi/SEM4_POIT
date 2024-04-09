function myPromise() {
    return new Promise((resolve) => {
        setTimeout(() => {
            const randomNumber = Math.random();
            resolve(randomNumber);
        }, 3000);
    });
}
myPromise()
    .then((result) => {
        console.log(result);
    })
    .catch((error) => {
        console.error(error);
    });