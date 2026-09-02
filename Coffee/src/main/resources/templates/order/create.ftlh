<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Order — Brewly">

<div class="order-page">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="order-card">
                    <div class="text-center mb-4">
                        <h2>☕ Order Coffee</h2>
                        <p class="text-secondary">Fill in the details to place your order.</p>
                    </div>

                    <#if error??>
                        <div class="alert alert-danger">${error}</div>
                    </#if>

                    <form action="/order/create" method="post">
                        <input type="hidden" name="coffeeId" value="${coffeeId!}">

                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" name="quantity" class="form-control" value="1" min="1" required>
                        </div>

                        <button type="submit" class="btn-order-submit">Place Order →</button>
                    </form>

                    <div class="text-center mt-3">
                        <a href="/menu" class="text-decoration-none">← Back to Menu</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.layout>