<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Specialty — Brewly">

<div class="specialty-page">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="specialty-title">Our Specialty</h1>
            <p class="specialty-subtitle">Signature blends crafted to deliver unique and memorable experiences.</p>
        </div>

        <div class="specialty-grid">
            <div class="specialty-card">
                <div class="specialty-icon">☕</div>
                <h3>Signature Blends</h3>
                <p>Our exclusive blends are crafted to deliver unique and memorable tasting experiences.</p>
            </div>
            <div class="specialty-card">
                <div class="specialty-icon">🌱</div>
                <h3>Sustainable Sourcing</h3>
                <p>We source our beans from sustainable farms that care about the environment.</p>
            </div>
            <div class="specialty-card">
                <div class="specialty-icon">👨‍🍳</div>
                <h3>Expert Baristas</h3>
                <p>Our baristas are trained to perfection, ensuring every cup is a masterpiece.</p>
            </div>
            <div class="specialty-card">
                <div class="specialty-icon">❤️</div>
                <h3>Cozy Atmosphere</h3>
                <p>More than just coffee — a place to relax, connect, and feel at home.</p>
            </div>
        </div>
    </div>
</div>

<style>
    .specialty-page {
        background: #FDF8F3;
        min-height: 70vh;
    }
    .specialty-title {
        font-size: 3rem;
        font-weight: 800;
        color: #2C1810;
    }
    .specialty-subtitle {
        font-size: 1.2rem;
        color: #8B6B4D;
    }
    .specialty-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 25px;
    }
    .specialty-card {
        background: #fff;
        padding: 35px 25px;
        border-radius: 20px;
        text-align: center;
        border: 1px solid #F5EDE6;
        transition: all 0.3s ease;
    }
    .specialty-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 40px rgba(0,0,0,0.08);
        border-color: #D4A574;
    }
    .specialty-icon {
        font-size: 3rem;
        margin-bottom: 15px;
    }
    .specialty-card h3 {
        font-size: 1.3rem;
        color: #2C1810;
        margin-bottom: 10px;
    }
    .specialty-card p {
        color: #8B6B4D;
        font-size: 0.95rem;
        margin: 0;
    }
    @media (max-width: 992px) {
        .specialty-grid { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 576px) {
        .specialty-grid { grid-template-columns: 1fr; }
        .specialty-title { font-size: 2.2rem; }
    }
</style>

</@layout.layout>