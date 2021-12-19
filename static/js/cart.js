import { getCsrfToken } from './csrfToken.js'


let prevQuantity = undefined
let prevPriceTotal = undefined
$('.cartItemQuantity').on('focusin', function() {
    prevQuantity = $(this).val()
    prevPriceTotal = getCartItemPriceTotal(this).text()
    prevPriceTotal = getFloatFromPriceString(prevPriceTotal)
})

$('.cartItemQuantity').on('input', function() {
    const newQuantity = $(this).val()
    const price = getCartItemPrice(this)
    const productId = $(this).closest('.cartItem').data('productid')
    console.log('Product ID: ' + productId)
    if (newQuantity > 0 && newQuantity < 100) {
        const newPriceTotal = roundFloat(price * newQuantity)
        updateCartItemPriceTotal(newPriceTotal, this)

        updateItemsTotal(newQuantity)
        updateItemsPriceTotal(newPriceTotal)
        updateCart(productId, 'set_quantity', newQuantity)
    } else {
        // Set total price to the price of 1 item
        getCartItemPriceTotal(this).text(`$${price}`)

        updateItemsTotal(1)
        updateItemsPriceTotal(price)
        updateCart(productId, 'set_quantity', 1)
    }
})

function updateCartItemPriceTotal(newPriceTotal, cartItemQuantityInput) {
    getCartItemPriceTotal(cartItemQuantityInput).text(`$${newPriceTotal}`)
}

function updateItemsTotal(newQuantity) {
    const prevItemsTotal = parseInt($('#itemsTotal').text())
    const newItemsTotal = prevItemsTotal + (newQuantity - prevQuantity)
    $('#itemsTotal').text(newItemsTotal)
    prevQuantity = newQuantity
}

function updateItemsPriceTotal(newPriceTotal) {
    let prevItemsPriceTotal = $('#itemsPriceTotal').text()
    prevItemsPriceTotal = getFloatFromPriceString(prevItemsPriceTotal)
    let newItemsPriceTotal = prevItemsPriceTotal + (newPriceTotal - prevPriceTotal)
    newItemsPriceTotal = roundFloat(newItemsPriceTotal)
    $('#itemsPriceTotal').text(`$${newItemsPriceTotal}`)
    prevPriceTotal = newPriceTotal
}

function updateItemsTotalAndItemsPriceTotalOnDelete(deleteFromCartBtn) {
    prevQuantity = $(deleteFromCartBtn).closest('.cartItem').find('.cartItemQuantity').val()
    prevPriceTotal = $(deleteFromCartBtn).closest('.cartItem').find('.cartItemPriceTotal').text()
    prevPriceTotal = getFloatFromPriceString(prevPriceTotal)
    updateItemsTotal(0)
    updateItemsPriceTotal(0)
}


function getCartItemPrice(cartItemQuantityInput) {
    let price = $(cartItemQuantityInput).closest('.cartItem').find('.cartItemPrice').text()
    return getFloatFromPriceString(price)
}

function getFloatFromPriceString(priceString) {
    priceString = priceString.substring(1) // get rid of "$" in front of the price
    return parseFloat(priceString)
}

function getCartItemPriceTotal(cartItemQuantityInput) {
    return $(cartItemQuantityInput).closest('.cartItem').find('.cartItemPriceTotal')
}

function roundFloat(number) {
    return Math.round(number * 100) / 100
}


$(window).on('load', setCartItemCount())

$('.addToCartBtn').on('click', function() {
    changeAddToCartBtn(this)  // only for 'shop' page
    updateCart(this.dataset.productid, this.dataset.action)
    setCartItemCount()
})

$('.deleteFromCartBtn').on('click', function() {
    removeCartItemFromPage(this) // only for 'cart' page
    updateCart(this.dataset.productid, this.dataset.action)
    setCartItemCount()
    updateItemsTotalAndItemsPriceTotalOnDelete(this)
})


function changeAddToCartBtn(btn) {
    $(btn).wrap('<a href="/cart"></a>')
    $(btn).attr('class', 'btn btn-danger mt-3 mb-2 px-4')
    $(btn).text('GO TO CART')
}

function updateCart(productId, action, newQuantity=1) {
    const url = '/update_cart'

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': getCsrfToken()
        },
        body: JSON.stringify({'product_id': productId, 'action': action, 'new_quantity': newQuantity})
    })
    .then((response) => {
        return response.json()
    }).then((data) => {
        setCartItemCount()
    })
}

function setCartItemCount(cartItemCount) {
    const url = '/cart_item_count'
    $.getJSON(url, function(data) {
        $('#cartItemCount').text(data['cart_item_count'])
    })
}

function removeCartItemFromPage(deleteFromCartBtn) {
    $(deleteFromCartBtn).closest('.cartItem').remove()

    // If there are no items anymore, switch to empty cart
    if (!$('.cartItem')[0]) {
        let emptyCartDiv = $('<div>')
            .attr('id', 'emptyCart')
            .attr('class', 'container my-5 p-5 d-flex flex-column justify-content-center align-items-center lead fw-bold')
            .append($('<div>The cart is empty</div>'))
            .append(
                $('<a>')
                    .attr('href', '/shop')
                    .append(
                        $('<button>GO SHOPPING</button>')
                            .attr('class', 'btn btn-success mt-3 px-4 py-3')
                    )
            )
        
        $('main').html(emptyCartDiv)
    }
}





