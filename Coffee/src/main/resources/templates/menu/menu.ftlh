<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Menu — Brewly">

<div class="menu-page">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="menu-title">Our Menu</h1>
            <p class="menu-subtitle">Handcrafted drinks and treats made for every coffee lover.</p>
        </div>

        <#if coffees?? && coffees?size gt 0>
            <div class="menu-grid">
                <#list coffees as coffee>
                    <div class="menu-card">
                        <div class="menu-card-icon">☕</div>
                        <div class="menu-card-info">
                            <h3>${coffee.name}</h3>
                            <p>${coffee.description!}</p>
                            <div class="menu-card-bottom">
                                <span class="menu-card-price">$${coffee.price}</span>
                                <a href="/order/create?coffeeId=${coffee.id}" class="btn-order-now">Order Now</a>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        <#else>
            <div class="text-center py-5">
                <p class="text-secondary">No coffees available yet. ☕</p>
            </div>
        </#if>
    </div>
</div>

</@layout.layout>