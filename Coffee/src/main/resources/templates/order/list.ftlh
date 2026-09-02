<#import "../layout/main.ftlh" as layout>
<@layout.layout title="My Orders — Brewly">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-dark">
            <i class="fas fa-shopping-bag text-primary me-2"></i>My Orders
        </h2>
        <a href="/menu" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Order Now
        </a>
    </div>

    <#if orders?? && orders?size gt 0>
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Order #</th>
                        <th>Product</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <#list orders as order>
                        <tr>
                            <td class="fw-bold">${order.number}</td>
                            <td>${order.coffeeName}</td>
                            <td class="fw-bold">$${order.total}</td>
                            <td>
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
                            </td>
                            <td>${order.createdAt!""}</td>
                            <td>
                                <a href="/order/number/${order.number}" class="btn btn-sm btn-outline-primary">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    <#else>
        <div class="text-center py-5">
            <i class="fas fa-shopping-bag text-secondary" style="font-size: 4rem;"></i>
            <h4 class="mt-3 text-secondary">No orders yet</h4>
            <p class="text-secondary">Start ordering your favorite coffee.</p>
            <a href="/menu" class="btn btn-primary mt-3">
                <i class="fas fa-coffee me-2"></i>View Menu
            </a>
        </div>
    </#if>
</div>

</@layout.layout>