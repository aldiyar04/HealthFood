import { getCsrfToken } from './csrfToken.js'

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
})



function changeAddToCartBtn(btn) {
    $(btn).wrap('<a href="/cart"></a>')
    $(btn).attr('class', 'btn btn-danger mt-3 mb-2 px-4')
    $(btn).text('GO TO CART')
}

function updateCart(productId, action) {
    const url = '/update_cart'

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': getCsrfToken()
        },
        body: JSON.stringify({'product_id': productId, 'action': action})
    })
    .then((response) => {
        return response.json()
    }).then((data) => {
        console.log(data)
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

    console.log('Entered removeCartItemFromPage')

    // If there are no items anymore, refresh the page
    // with a bit of delay to let the server delete the last item before the page reloads
    if (!$('.cartItem')[0]) {
        setTimeout(function() {
            location.reload(true)
        }, 50);
    }
}





