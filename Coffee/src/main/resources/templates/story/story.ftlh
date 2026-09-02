<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Our Story — Brewly">

<div class="story-page">
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="story-title">Our Story</h1>
                <p class="story-subtitle">A journey fueled by passion for coffee.</p>
                <div class="story-text">
                    <p>
                        Brewly began with a simple idea — to create a cozy space where great coffee brings people together.
                    </p>
                    <p>
                        What started as a small coffee cart has grown into a community of coffee lovers.
                        But our mission remains the same: serve honest coffee, made with heart.
                    </p>
                    <div class="story-stats">
                        <div class="stat-item">
                            <span class="stat-number">2018</span>
                            <span class="stat-label">Founded</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">50K+</span>
                            <span class="stat-label">Happy Customers</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">100%</span>
                            <span class="stat-label">Arabica Beans</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">12+</span>
                            <span class="stat-label">Skilled Baristas</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <div class="story-image">☕</div>
            </div>
        </div>
    </div>
</div>

<style>
    .story-page {
        background: #FDF8F3;
        min-height: 70vh;
    }
    .story-title {
        font-size: 3rem;
        font-weight: 800;
        color: #2C1810;
    }
    .story-subtitle {
        font-size: 1.2rem;
        color: #8B6B4D;
        margin-bottom: 20px;
    }
    .story-text p {
        color: #5A3A2A;
        font-size: 1.05rem;
        line-height: 1.8;
    }
    .story-stats {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-top: 30px;
    }
    .stat-item {
        text-align: center;
        background: #fff;
        padding: 20px;
        border-radius: 16px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
    }
    .stat-number {
        display: block;
        font-size: 1.8rem;
        font-weight: 800;
        color: #D4A574;
    }
    .stat-label {
        font-size: 0.85rem;
        color: #8B6B4D;
    }
    .story-image {
        font-size: 15rem;
        background: linear-gradient(135deg, #D4A574, #A67B5B);
        width: 350px;
        height: 350px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
        box-shadow: 0 20px 60px rgba(212, 165, 116, 0.2);
    }
    @media (max-width: 992px) {
        .story-image {
            width: 250px;
            height: 250px;
            font-size: 10rem;
            margin-top: 30px;
        }
        .story-stats { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 576px) {
        .story-title { font-size: 2.2rem; }
        .story-image { width: 180px; height: 180px; font-size: 6rem; }
    }
</style>

</@layout.layout>