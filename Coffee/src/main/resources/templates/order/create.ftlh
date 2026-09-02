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

<style>
    .order-page { background: #FDF8F3; min-height: 70vh; display: flex; align-items: center; }
    .order-card { background: #fff; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); width: 100%; }
    .order-card h2 { font-size: 1.8rem; color: #2C1810; }
    .order-card .form-group { margin-bottom: 18px; }
    .order-card .form-group label { font-weight: 600; color: #2C1810; }
    .order-card .form-control { border-radius: 12px; border: 1px solid #F5EDE6; padding: 12px 16px; background: #FDF8F3; }
    .btn-order-submit { width: 100%; padding: 14px; border-radius: 30px; border: none; background: #D4A574; color: #fff; font-weight: 700; font-size: 1.1rem; cursor: pointer; transition: all 0.3s ease; }
    .btn-order-submit:hover { background: #A67B5B; }
</style>

</@layout.layout>