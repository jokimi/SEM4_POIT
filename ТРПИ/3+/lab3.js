function createPhoneNumber(numbers) {
    if (numbers.length !== 10) {
        throw new Error("Массив должен содержать 10 чисел.");
    }
    var areaCode = numbers.slice(0, 3).join("");
    var firstPart = numbers.slice(3, 6).join("");
    var secondPart = numbers.slice(6).join("");
    return "(".concat(areaCode, ") ").concat(firstPart, "-").concat(secondPart);
}
var phoneNumber = createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
console.log(phoneNumber + "\n");
//-----------------------------------------------------------------------
var Challenge = /** @class */ (function () {
    function Challenge() {
    }
    Challenge.solution = function (number) {
        if (number < 0) {
            return 0;
        }
        var sum = 0;
        for (var i = 3; i < number; i++) {
            if (i % 3 === 0 || i % 5 === 0) {
                sum += i;
            }
        }
        return sum;
    };
    return Challenge;
}());
var result = Challenge.solution(10);
console.log(result + "\n");
//-----------------------------------------------------------------------
function rotateArray(nums, k) {
    var n = nums.length;
    k = k % n; // Убедимся, что k находится в пределах длины массива
    // Перевернем весь массив
    reverse(nums, 0, n - 1);
    console.log("\u043F\u043E\u0432\u0435\u0440\u043D\u0443\u0442\u044C \u043D\u0430 1 \u0448\u0430\u0433 \u0432\u043F\u0440\u0430\u0432\u043E: [".concat(nums, "]"));
    // Перевернем первые k элементов
    reverse(nums, 0, k - 1);
    console.log("\u043F\u043E\u0432\u0435\u0440\u043D\u0443\u0442\u044C \u043D\u0430 2 \u0448\u0430\u0433\u0430 \u0432\u043F\u0440\u0430\u0432\u043E: [".concat(nums, "]"));
    // Перевернем оставшиеся элементы
    reverse(nums, k, n - 1);
    console.log("\u043F\u043E\u0432\u0435\u0440\u043D\u0443\u0442\u044C \u043D\u0430 3 \u0448\u0430\u0433\u0430 \u0432\u043F\u0440\u0430\u0432\u043E: [".concat(nums, "]"));
    return nums;
}
function reverse(nums, start, end) {
    while (start < end) {
        var temp = nums[start];
        nums[start] = nums[end];
        nums[end] = temp;
        start++;
        end--;
    }
}
var nums = [1, 2, 3, 4, 5, 6, 7];
console.log("\u0438\u0441\u0445\u043E\u0434\u043D\u044B\u0439 \u043C\u0430\u0441\u0441\u0438\u0432: [".concat(nums, "]"));
var k = 3;
var res = rotateArray(nums, k);
console.log(res);
console.log("\n");
//-----------------------------------------------------------------------
function findMedianSortedArrays(nums1, nums2) {
    var merged = mergeArrays(nums1, nums2);
    var n = merged.length;
    if (n % 2 === 0) {
        var mid = n / 2;
        var median = (merged[mid - 1] + merged[mid]) / 2;
        console.log("\u043E\u0431\u044A\u0435\u0434\u0438\u043D\u0435\u043D\u0438\u0435 \u043C\u0430\u0441\u0441\u0438\u0432\u043E\u0432 = [".concat(merged, "], \u043C\u0435\u0434\u0438\u0430\u043D\u0430 - ").concat(median, "."));
        return median;
    }
    else {
        var mid = Math.floor(n / 2);
        var median = merged[mid];
        console.log("\u043E\u0431\u044A\u0435\u0434\u0438\u043D\u0435\u043D\u0438\u0435 \u043C\u0430\u0441\u0441\u0438\u0432\u043E\u0432 = [".concat(merged, "], \u043C\u0435\u0434\u0438\u0430\u043D\u0430 - ").concat(median, "."));
        return median;
    }
}
function mergeArrays(nums1, nums2) {
    var merged = [];
    var i = 0;
    var j = 0;
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
var nums1 = [1, 3];
var nums2 = [2];
var result1 = findMedianSortedArrays(nums1, nums2);
console.log(result1);
var nums3 = [1, 2];
var nums4 = [3, 4];
var result2 = findMedianSortedArrays(nums3, nums4);
console.log(result2);
