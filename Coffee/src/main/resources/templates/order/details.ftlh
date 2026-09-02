<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Order Details — Brewly">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-body p-5">

                    <!-- Заголовок -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="fw-bold text-dark">
                            <i class="fas fa-receipt text-primary me-2"></i>Order #${order.number}
                        </h2>
                        <span class="badge bg-success fs-6 px-3 py-2">
                            <i class="fas fa-check-circle me-1"></i>${order.status}
                        </span>
                    </div>

                    <hr>

                    <!-- Информация -->
                    <div class="row g-3">
                        <div class="col-md-6">
                            <p class="text-secondary mb-0 small">Order Number</p>
                            <p class="fw-semibold">${order.number}</p>
                        </div>
                        <div class="col-md-6">
                            <p class="text-secondary mb-0 small">Date</p>
                            <p class="fw-semibold">${order.createdAt?!""}</p>
                        </div>
                        <div class="col-md-6">
                            <p class="text-secondary mb-0 small">Customer</p>
                            <p class="fw-semibold">${order.userName}</p>
                        </div>
                        <div class="col-md-6">
                            <p class="text-secondary mb-0 small">Status</p>
                            <p class="fw-semibold">
                                <#if order.status == "PAID">
                                    <span class="badge bg-success">Paid</span>
                                <#elseif order.status == "PENDING">
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <#elseif order.status == "SHIPPED">
                                    <span class="badge bg-info">Shipped</span>
                                <#elseif order.status == "DELIVERED">
                                    <span class="badge bg-primary">Delivered</span>
                                <#elseif order.status == "CANCELLED">
                                    <span class="badge bg-danger">Cancelled</span>
                                </#if>
                            </p>
                        </div>
                    </div>

                    <hr>

                    <!-- Товар -->
                    <h5 class="fw-bold text-dark mb-3">
                        <i class="fas fa-coffee text-primary me-2"></i>Items
                    </h5>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <span>☕</span>
                                            <span class="fw-semibold">${order.coffeeName}</span>
                                        </div>
                                    </td>
                                    <td>$${order.priceAtTime}</td>
                                    <td>${order.quantity}</td>
                                    <td class="fw-bold text-primary">$${order.total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <hr>

                    <!-- Итог -->
                    <div class="d-flex justify-content-end">
                        <div style="min-width: 200px;">
                            <div class="d-flex justify-content-between py-1">
                                <span class="text-secondary">Subtotal</span>
                                <span class="fw-bold">$${order.total}</span>
                            </div>
                            <div class="d-flex justify-content-between py-1">
                                <span class="text-secondary">Shipping</span>
                                <span class="fw-bold">$0</span>
                            </div>
                            <div class="d-flex justify-content-between py-1">
                                <span class="text-secondary">Tax</span>
                                <span class="fw-bold">$0</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between py-1">
                                <span class="fw-bold fs-5">Total</span>
                                <span class="fw-bold text-primary fs-5">$${order.total}</span>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <!-- Кнопки -->
                    <div class="d-flex gap-3 mt-3">
                        <a href="/order/my" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-2"></i>Back to Orders
                        </a>
                        <#if order.status == "PENDING" || order.status == "PAID">
                            <form action="/order/cancel/${order.id}" method="post" style="display: inline;">
                                <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Cancel this order?')">
                                    <i class="fas fa-times me-2"></i>Cancel Order
                                </button>
                            </form>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.layout>