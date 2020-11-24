window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxPrice = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1));

  const saleProfit = document.getElementById("profit");
  const price_result = inputValue * 0.1
  saleProfit.innerHTML =(Math.floor(inputValue - price_result));
  });
});
