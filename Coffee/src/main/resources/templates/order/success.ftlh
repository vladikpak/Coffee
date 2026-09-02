<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Order Successful — Brewly">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">

            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-body p-5 text-center">

                    <div class="mb-4">
                        <div class="bg-success bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto"
                             style="width: 100px; height: 100px;">
                            <i class="fas fa-check-circle text-success" style="font-size: 50px;"></i>
                        </div>
                    </div>

                    <h2 class="fw-bold text-dark mb-2">✅ Order Successful!</h2>
                    <p class="text-secondary mb-4">Your order has been placed successfully.</p>

                    <hr>

                    <div class="text-start mb-4">
                        <#if order??>
                            <div class="d-flex justify-content-between py-2">
                                <span class="text-secondary">Order Number</span>
                                <span class="fw-bold text-dark">${order.number}</span>
                            </div>
                            <div class="d-flex justify-content-between py-2">
                                <span class="text-secondary">Product</span>
                                <span class="fw-bold text-dark">${order.coffeeName}</span>
                            </div>
                            <div class="d-flex justify-content-between py-2">
                                <span class="text-secondary">Quantity</span>
                                <span class="fw-bold text-dark">${order.quantity}</span>
                            </div>
                            <div class="d-flex justify-content-between py-2">
                                <span class="text-secondary">Total</span>
                                <span class="fw-bold text-primary">$${order.total}</span>
                            </div>
                            <div class="d-flex justify-content-between py-2">
                                <span class="text-secondary">Status</span>
                                <span class="badge bg-success fs-6 px-3 py-2">PAID</span>
                            </div>
                        <#else>
                            <p class="text-center text-secondary">Your order has been placed!</p>
                        </#if>
                    </div>

                    <hr>

                    <div class="d-flex gap-3">
                        <a href="/order/my" class="btn btn-primary flex-grow-1">
                            <i class="fas fa-list me-2"></i>My Orders
                        </a>
                        <a href="/menu" class="btn btn-outline-secondary">
                            <i class="fas fa-coffee me-2"></i>Order More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.layout>