window.addEventListener('load', () => {
  const  buyCount = document.getElementById("order_buy_count");
  buyCount.addEventListener("input", () => {
    const inputValue = buyCount.value;
    const priceInput = document.getElementById("price");
    const price = priceInput .innerHTML
    const totalPrice = document.getElementById("total_price");
    totalPrice.innerHTML = Math.floor(inputValue * price);
 })
 })
 
