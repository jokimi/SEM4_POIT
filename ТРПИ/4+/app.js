const products = {
    "Обувь": {
        "Ботинки": [
            { id: 1, size: 39, color: "черный", price: 100 },
            { id: 2, size: 40, color: "коричневый", price: 120 },
        ],
        "Кроссовки": [
            { id: 3, size: 41, color: "синий", price: 80 },
            { id: 4, size: 42, color: "красный", price: 90 },
        ],
        "Сандалии": [
            { id: 5, size: 39, color: "черный", price: 60 },
            { id: 6, size: 37, color: "розовый", price: 70 },
        ],
    },
};
// Итератор для объекта products
function* iterateProducts(products) {
    for (const category in products) {
        for (const type in products[category]) {
            for (const shoe of products[category][type]) {
                yield shoe;
            }
        }
    }
}
const productIterator = iterateProducts(products);
console.log(productIterator);
console.log("");
// Фильтр обуви по цене, размеру и цвету
function filterShoes(products, minPrice, maxPrice, size, color) {
    const filteredShoes = [];
    for (const category in products) {
        for (const type in products[category]) {
            for (const shoe of products[category][type]) {
                if ((!minPrice || shoe.price >= minPrice) &&
                    (!maxPrice || shoe.price <= maxPrice) &&
                    (!size || shoe.size === size) &&
                    (!color || shoe.color === color)) {
                    filteredShoes.push(shoe.id);
                }
            }
        }
    }
    return filteredShoes;
}
console.log(filterShoes(products, 60, 100, 39, "черный"));
console.log("");
// Оптимизация создания нового товара
function addShoe(products, category, type, shoe) {
    if (!products[category]) {
        products[category] = {};
    }
    if (!products[category][type]) {
        products[category][type] = [];
    }
    products[category][type].push(shoe);
}
addShoe(products, "Обувь", "Сапоги", {
    id: 7,
    size: 38,
    color: "серый",
    price: 80,
});
console.log(products);
console.log("");
function setFinalPrice(shoe) {
    if (shoe.discount !== undefined) {
        shoe.finalPrice = shoe.price * (1 - shoe.discount);
    }
}
function getFinalPrice(shoe) {
    if (shoe.finalPrice !== undefined) {
        return shoe.finalPrice;
    }
    return shoe.price;
}
const shoeWithDiscount = {
    id: 8,
    size: 40,
    color: "черный",
    price: 100,
    discount: 0.2,
};
setFinalPrice(shoeWithDiscount);
console.log(getFinalPrice(shoeWithDiscount));
console.log("");
//# sourceMappingURL=app.js.map