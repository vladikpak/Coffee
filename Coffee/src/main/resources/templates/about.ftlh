<#import "layout/main.ftlh" as layout>
<@layout.layout title="About — Brewly">

<div class="about-page">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="about-title">About Us</h1>
            <p class="about-subtitle">More than just coffee. It's a love for people.</p>
        </div>

        <div class="about-content">
            <div class="about-mission">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <h2>Our Promise</h2>
                        <p>
                            Great coffee. Honest ingredients. Warm service. Always.
                            Brewly is a neighborhood coffee shop and a love for people.
                            We believe great coffee can brighten your day and bring people closer.
                        </p>
                    </div>
                    <div class="col-lg-6 text-center">
                        <div class="about-mission-icon">❤️</div>
                    </div>
                </div>
            </div>

            <div class="about-values">
                <div class="row g-4">
                    <div class="col-md-3 col-6">
                        <div class="value-card">
                            <span class="value-icon">☕</span>
                            <h5>Crafted by our</h5>
                            <p>Expert Baristas</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-card">
                            <span class="value-icon">🌱</span>
                            <h5>Only the best</h5>
                            <p>Arabica Beans</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-card">
                            <span class="value-icon">🏠</span>
                            <h5>A place to relax</h5>
                            <p>Cozy Ambience</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-card">
                            <span class="value-icon">🤝</span>
                            <h5>Bringing people</h5>
                            <p>Community</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .about-page {
        background: #FDF8F3;
        min-height: 70vh;
    }
    .about-title {
        font-size: 3rem;
        font-weight: 800;
        color: #2C1810;
    }
    .about-subtitle {
        font-size: 1.2rem;
        color: #8B6B4D;
    }
    .about-mission {
        background: #fff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        margin-bottom: 40px;
    }
    .about-mission h2 {
        font-size: 2rem;
        color: #2C1810;
        margin-bottom: 15px;
    }
    .about-mission p {
        color: #5A3A2A;
        font-size: 1.05rem;
        line-height: 1.8;
    }
    .about-mission-icon {
        font-size: 8rem;
    }
    .about-values {
        margin-top: 20px;
    }
    .value-card {
        background: #fff;
        padding: 25px 15px;
        border-radius: 16px;
        text-align: center;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        height: 100%;
    }
    .value-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.08);
    }
    .value-icon {
        font-size: 2.5rem;
        display: block;
        margin-bottom: 10px;
    }
    .value-card h5 {
        font-size: 1rem;
        color: #2C1810;
        font-weight: 600;
        margin: 0;
    }
    .value-card p {
        color: #8B6B4D;
        font-size: 0.9rem;
        margin: 5px 0 0;
    }
    @media (max-width: 576px) {
        .about-title { font-size: 2.2rem; }
        .about-mission { padding: 25px; }
        .about-mission-icon { font-size: 5rem; }
    }
</style>

</@layout.layout>