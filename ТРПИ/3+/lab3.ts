function createPhoneNumber(numbers: number[]): string {
    if (numbers.length !== 10) {
        throw new Error("Массив должен содержать 10 чисел.");
    }
    const areaCode = numbers.slice(0, 3).join("");
    const firstPart = numbers.slice(3, 6).join("");
    const secondPart = numbers.slice(6).join("");
    return `(${areaCode}) ${firstPart}-${secondPart}`;
}
const phoneNumber = createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
console.log(phoneNumber + "\n");

//-----------------------------------------------------------------------

class Challenge {
    static solution(number: number): number {
        if (number < 0) {
            return 0;
        }
        let sum = 0;
        for (let i = 3; i < number; i++) {
            if (i % 3 === 0 || i % 5 === 0) {
                sum += i;
            }
        }
        return sum;
    }
}
const result = Challenge.solution(10);
console.log(result + "\n");

//-----------------------------------------------------------------------

function rotateArray(nums: number[], k: number): number[] {
    const n = nums.length;
    k = k % n; // Убедимся, что k находится в пределах длины массива
    // Перевернем весь массив
    reverse(nums, 0, n - 1);
    console.log(`повернуть на 1 шаг вправо: [${nums}]`);
    // Перевернем первые k элементов
    reverse(nums, 0, k - 1);
    console.log(`повернуть на 2 шага вправо: [${nums}]`);
    // Перевернем оставшиеся элементы
    reverse(nums, k, n - 1);
    console.log(`повернуть на 3 шага вправо: [${nums}]`);
    return nums;
}
function reverse(nums: number[], start: number, end: number): void {
    while (start < end) {
        const temp = nums[start];
        nums[start] = nums[end];
        nums[end] = temp;
        start++;
        end--;
    }
}
const nums = [1, 2, 3, 4, 5, 6, 7];
console.log(`исходный массив: [${nums}]`);
const k = 3;
const res = rotateArray(nums, k);
console.log(res);
console.log("\n");

//-----------------------------------------------------------------------

function findMedianSortedArrays(nums1: number[], nums2: number[]): number {
    const merged = mergeArrays(nums1, nums2);
    const n = merged.length;
    if (n % 2 === 0) {
        const mid = n / 2;
        const median = (merged[mid - 1] + merged[mid]) / 2;
        console.log(`объединение массивов = [${merged}], медиана - ${median}.`);
        return median;
    } else {
        const mid = Math.floor(n / 2);
        const median = merged[mid];
        console.log(`объединение массивов = [${merged}], медиана - ${median}.`);
        return median;
    }
}
function mergeArrays(nums1: number[], nums2: number[]): number[] {
    const merged: number[] = [];
    let i = 0;
    let j = 0;
    while (i < nums1.length && j < nums2.length) {
        if (nums1[i] <= nums2[j]) {
            merged.push(nums1[i]);
            i++;
        }
        else {
            merged.push(nums2[j]);
            j++;
        }
    }
    while (i < nums1.length) {
        merged.push(nums1[i]);
        i++;
    }
    while (j < nums2.length) {
        merged.push(nums2[j]);
        j++;
    }
    return merged;
}
const nums1 = [1, 3];
const nums2 = [2];
const result1 = findMedianSortedArrays(nums1, nums2);
console.log(result1);
const nums3 = [1, 2];
const nums4 = [3, 4];
const result2 = findMedianSortedArrays(nums3, nums4);
console.log(result2);