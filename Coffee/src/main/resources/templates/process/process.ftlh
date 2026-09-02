<#import "../layout/main.ftlh" as layout>
<@layout.layout title="Our Process — Brewly">

<div class="process-page">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="process-title">From Bean to Cup</h1>
            <p class="process-subtitle">We care about every single step.</p>
        </div>

        <div class="process-steps">
            <div class="process-step">
                <div class="step-number">01</div>
                <div class="step-icon">🌱</div>
                <h3>Select</h3>
                <p>We handpick the finest coffee beans from the best farms worldwide.</p>
            </div>
            <div class="process-step">
                <div class="step-number">02</div>
                <div class="step-icon">🔥</div>
                <h3>Roast</h3>
                <p>Roasted to perfection for rich, bold flavor and aroma.</p>
            </div>
            <div class="process-step">
                <div class="step-number">03</div>
                <div class="step-icon">☕</div>
                <h3>Brew</h3>
                <p>Expertly brewed to bring out the best in every bean.</p>
            </div>
            <div class="process-step">
                <div class="step-number">04</div>
                <div class="step-icon">❤️</div>
                <h3>Serve</h3>
                <p>Delivered to you with warmth, care, and a smile.</p>
            </div>
        </div>
    </div>
</div>

<style>
    .process-page {
        background: #FDF8F3;
        min-height: 70vh;
    }
    .process-title {
        font-size: 3rem;
        font-weight: 800;
        color: #2C1810;
    }
    .process-subtitle {
        font-size: 1.2rem;
        color: #8B6B4D;
    }
    .process-steps {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 30px;
        margin-top: 40px;
    }
    .process-step {
        text-align: center;
        background: #fff;
        padding: 35px 20px;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        border: 1px solid #F5EDE6;
        transition: all 0.3s ease;
    }
    .process-step:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 40px rgba(0,0,0,0.08);
    }
    .step-number {
        font-size: 2.5rem;
        font-weight: 800;
        color: #D4A574;
        opacity: 0.2;
    }
    .step-icon {
        font-size: 3rem;
        margin: 10px 0;
    }
    .process-step h3 {
        font-size: 1.3rem;
        color: #2C1810;
        margin: 10px 0 8px;
    }
    .process-step p {
        color: #8B6B4D;
        font-size: 0.95rem;
        margin: 0;
    }
    @media (max-width: 992px) {
        .process-steps { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 576px) {
        .process-steps { grid-template-columns: 1fr; }
        .process-title { font-size: 2.2rem; }
    }
</style>

</@layout.layout>