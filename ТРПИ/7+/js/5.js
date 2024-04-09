async function myAsyncFunction() {
    const result = await Promise.resolve(21);
    console.log(result);
    const newResult = result * 2;
    console.log(newResult);
}
myAsyncFunction();