<#import "layout/main.ftlh" as layout>
<@layout.layout title="Home">

<!-- ============================================================ -->
<!-- ===== HERO ===== -->
<!-- ============================================================ -->
<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1>Brewed to <span>Perfection</span></h1>
            <p>Every cup is crafted with premium beans and passion for a richer experience.</p>
            <a href="/menu" class="btn-hero">Explore Our Menu →</a>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== ПРОМО ===== -->
<!-- ============================================================ -->
<section class="promo">
    <div class="container">
        <div class="promo-box">
            <div class="promo-icon">🥐</div>
            <div>
                <h3>Get 1 Free Croissant</h3>
                <p>with any coffee today!</p>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== ПОПУЛЯРНЫЕ НАПИТКИ ===== -->
<!-- ============================================================ -->
<section class="featured">
    <div class="container">
        <h2 class="section-title">Featured Drinks</h2>
        <p class="section-sub">Handpicked favorites, crafted with care.</p>

        <div class="drinks-grid">
            <div class="drink-card">
                <div class="drink-icon">☕</div>
                <h4>Espresso Masterpiece</h4>
                <p>Bold and rich espresso with a perfect crema.</p>
                <div class="drink-price">$2.90</div>
                <a href="/order/create?coffeeId=1" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">🧊</div>
                <h4>Iced Favorites</h4>
                <p>Chilled, smooth, and perfect for any day.</p>
                <div class="drink-price">$3.80</div>
                <a href="/order/create?coffeeId=2" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">☕</div>
                <h4>Coffee Favorites</h4>
                <p>Timeless classics that warm your soul.</p>
                <div class="drink-price">$3.50</div>
                <a href="/order/create?coffeeId=3" class="btn-order">Order Now</a>
            </div>
            <div class="drink-card">
                <div class="drink-icon">🌱</div>
                <h4>Organic Beans</h4>
                <p>Sustainably sourced and full of flavor.</p>
                <div class="drink-price">$3.90</div>
                <a href="/order/create?coffeeId=4" class="btn-order">Order Now</a>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== О КОМПАНИИ ===== -->
<!-- ============================================================ -->
<section class="about-home">
    <div class="container">
        <div class="about-grid">
            <div>
                <h2>Quality in Every Cup</h2>
                <p>We don't just make coffee, we craft experiences. Every cup is brewed with premium beans and passion.</p>
                <div class="features-list">
                    <span>✅ 100% Arabica Beans</span>
                    <span>✅ Expert Baristas</span>
                    <span>✅ Sustainable Sourcing</span>
                    <span>✅ Consistent Quality</span>
                </div>
            </div>
            <div class="about-cup">☕</div>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== ПРОЦЕСС ===== -->
<!-- ============================================================ -->
<section class="process-home">
    <div class="container">
        <h2 class="section-title">From Bean to Cup</h2>
        <p class="section-sub">We care about every single step.</p>
        <div class="process-grid">
            <div class="step">
                <span class="step-num">01</span>
                <span class="step-icon">🌱</span>
                <h5>Select</h5>
                <p>We handpick the finest beans.</p>
            </div>
            <div class="step">
                <span class="step-num">02</span>
                <span class="step-icon">🔥</span>
                <h5>Roast</h5>
                <p>Roasted to perfection.</p>
            </div>
            <div class="step">
                <span class="step-num">03</span>
                <span class="step-icon">☕</span>
                <h5>Brew</h5>
                <p>Expertly brewed.</p>
            </div>
            <div class="step">
                <span class="step-num">04</span>
                <span class="step-icon">❤️</span>
                <h5>Serve</h5>
                <p>Delivered with care.</p>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== РАССЫЛКА ===== -->
<!-- ============================================================ -->
<section class="newsletter-home">
    <div class="container">
        <div class="newsletter-box">
            <h2>📬 Subscribe for Updates</h2>
            <p>Get special offers and new arrivals straight to your inbox.</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Your email address">
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </div>
</section>

<!-- ============================================================ -->
<!-- ===== СТИЛИ ===== -->
<!-- ============================================================ -->
<style>
    /* ===== HERO ===== */
    .hero {
        background: linear-gradient(135deg, #2C1810, #4A2C1A);
        padding: 100px 0 80px;
        text-align: center;
        color: #fff;
        position: relative;
        overflow: hidden;
    }
    .hero::before {
        content: '☕';
        position: absolute;
        font-size: 300px;
        opacity: 0.05;
        top: -50px;
        right: -50px;
        transform: rotate(20deg);
    }
    .hero h1 {
        font-size: 4rem;
        font-weight: 800;
    }
    .hero h1 span {
        background: linear-gradient(90deg, #D4A574, #8B6B4D);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    .hero p {
        font-size: 1.2rem;
        color: rgba(255,255,255,0.7);
        max-width: 600px;
        margin: 15px auto 30px;
    }
    .btn-hero {
        padding: 14px 40px;
        border-radius: 50px;
        background: #D4A574;
        color: #fff;
        text-decoration: none;
        font-weight: 600;
        display: inline-block;
        transition: all 0.3s ease;
    }
    .btn-hero:hover {
        background: #A67B5B;
        transform: translateY(-3px);
        color: #fff;
    }

    /* ===== ПРОМО ===== */
    .promo {
        padding: 30px 0;
        background: #F5EDE6;
    }
    .promo-box {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 20px;
        background: linear-gradient(90deg, #D4A574, #A67B5B);
        padding: 25px;
        border-radius: 16px;
        color: #fff;
    }
    .promo-icon { font-size: 3rem; }
    .promo-box h3 { font-size: 1.6rem; margin: 0; }
    .promo-box p { margin: 0; opacity: 0.9; }

    /* ===== НАПИТКИ ===== */
    .featured {
        padding: 60px 0;
        background: #fff;
    }
    .section-title {
        font-size: 2.5rem;
        font-weight: 700;
        color: #2C1810;
        text-align: center;
    }
    .section-sub {
        text-align: center;
        color: #8B6B4D;
        font-size: 1.1rem;
        margin-bottom: 40px;
    }
    .drinks-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 25px;
    }
    .drink-card {
        background: #FDF8F3;
        padding: 30px 20px;
        border-radius: 16px;
        text-align: center;
        border: 1px solid #F5EDE6;
        transition: all 0.3s ease;
    }
    .drink-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 40px rgba(0,0,0,0.08);
    }
    .drink-icon { font-size: 3rem; margin-bottom: 10px; }
    .drink-card h4 { font-size: 1.1rem; color: #2C1810; }
    .drink-card p { color: #8B6B4D; font-size: 0.9rem; }
    .drink-price { font-size: 1.3rem; font-weight: 700; color: #D4A574; margin: 10px 0; }
    .btn-order {
        padding: 8px 25px;
        border: 2px solid #D4A574;
        color: #D4A574;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.85rem;
        transition: all 0.3s ease;
        display: inline-block;
    }
    .btn-order:hover {
        background: #D4A574;
        color: #fff;
    }

    /* ===== О КОМПАНИИ ===== */
    .about-home {
        padding: 60px 0;
        background: #F5EDE6;
    }
    .about-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 50px;
        align-items: center;
    }
    .about-grid h2 { font-size: 2.2rem; color: #2C1810; }
    .about-grid p { color: #5A3A2A; font-size: 1.05rem; line-height: 1.7; }
    .features-list {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 8px;
        margin-top: 20px;
    }
    .features-list span { color: #2C1810; font-weight: 500; }
    .about-cup {
        font-size: 12rem;
        text-align: center;
        background: linear-gradient(135deg, #D4A574, #A67B5B);
        width: 100%;
        max-width: 300px;
        height: 300px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
    }

    /* ===== ПРОЦЕСС ===== */
    .process-home {
        padding: 60px 0;
        background: #fff;
    }
    .process-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 30px;
        margin-top: 20px;
    }
    .step {
        text-align: center;
        padding: 20px;
    }
    .step-num { font-size: 2.5rem; font-weight: 800; color: #D4A574; opacity: 0.3; display: block; }
    .step-icon { font-size: 2.5rem; display: block; margin: 10px 0; }
    .step h5 { font-size: 1.1rem; color: #2C1810; }
    .step p { color: #8B6B4D; font-size: 0.9rem; }

    /* ===== РАССЫЛКА ===== */
    .newsletter-home {
        padding: 60px 0;
        background: linear-gradient(135deg, #2C1810, #4A2C1A);
        color: #fff;
    }
    .newsletter-box {
        text-align: center;
        max-width: 500px;
        margin: 0 auto;
    }
    .newsletter-box h2 { font-size: 2rem; }
    .newsletter-box p { color: rgba(255,255,255,0.7); }
    .newsletter-form {
        display: flex;
        gap: 10px;
    }
    .newsletter-form input {
        flex: 1;
        padding: 12px 20px;
        border-radius: 30px;
        border: none;
        background: rgba(255,255,255,0.1);
        color: #fff;
        outline: none;
    }
    .newsletter-form input::placeholder { color: rgba(255,255,255,0.4); }
    .newsletter-form button {
        padding: 12px 30px;
        border-radius: 30px;
        border: none;
        background: #D4A574;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .newsletter-form button:hover { background: #A67B5B; }

    /* ===== АДАПТИВ ===== */
    @media (max-width: 992px) {
        .drinks-grid { grid-template-columns: repeat(2, 1fr); }
        .process-grid { grid-template-columns: repeat(2, 1fr); }
        .about-grid { grid-template-columns: 1fr; text-align: center; }
        .about-cup { width: 200px; height: 200px; font-size: 6rem; }
        .hero h1 { font-size: 2.8rem; }
    }
    @media (max-width: 576px) {
        .drinks-grid { grid-template-columns: 1fr; }
        .process-grid { grid-template-columns: 1fr; }
        .hero h1 { font-size: 2rem; }
        .features-list { grid-template-columns: 1fr; }
        .newsletter-form { flex-direction: column; }
        .promo-box { flex-direction: column; text-align: center; }
    }
</style>

</@layout.layout>