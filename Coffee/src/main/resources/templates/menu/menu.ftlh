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

<style>
    .menu-page {
        background: #FDF8F3;
        min-height: 70vh;
    }
    .menu-title {
        font-size: 3rem;
        font-weight: 800;
        color: #2C1810;
    }
    .menu-subtitle {
        font-size: 1.2rem;
        color: #8B6B4D;
    }
    .menu-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 25px;
    }
    .menu-card {
        display: flex;
        align-items: center;
        gap: 20px;
        background: #fff;
        padding: 20px 25px;
        border-radius: 16px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        border: 1px solid #F5EDE6;
        transition: all 0.3s ease;
    }
    .menu-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.08);
    }
    .menu-card-icon {
        font-size: 2.8rem;
        flex-shrink: 0;
    }
    .menu-card-info {
        flex: 1;
    }
    .menu-card-info h3 {
        font-size: 1.2rem;
        color: #2C1810;
        margin: 0 0 5px;
    }
    .menu-card-info p {
        color: #8B6B4D;
        font-size: 0.9rem;
        margin: 0 0 10px;
    }
    .menu-card-bottom {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .menu-card-price {
        font-size: 1.2rem;
        font-weight: 700;
        color: #D4A574;
    }
    .btn-order-now {
        padding: 6px 20px;
        border-radius: 30px;
        background: #D4A574;
        color: #fff;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.85rem;
        transition: all 0.3s ease;
    }
    .btn-order-now:hover {
        background: #A67B5B;
        color: #fff;
    }
    @media (max-width: 768px) {
        .menu-grid { grid-template-columns: 1fr; }
        .menu-title { font-size: 2.2rem; }
    }
</style>

</@layout.layout>