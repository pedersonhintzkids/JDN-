<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>RITUAL X</title>
  <meta name="description" content="RITUAL X — clean, dark, underground. Limited drops. No noise." />
  <meta name="theme-color" content="#0a0a0a" />
  <style>
    :root{
      --bg:#070707;
      --panel:rgba(255,255,255,.04);
      --panel2:rgba(255,255,255,.06);
      --text:rgba(255,255,255,.92);
      --muted:rgba(255,255,255,.62);
      --soft:rgba(255,255,255,.10);
      --line:rgba(255,255,255,.12);
      --glow:rgba(255,255,255,.10);
      --radius:18px;
      --max:1080px;
      --shadow:0 14px 50px rgba(0,0,0,.55);
      --mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
      --sans: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji","Segoe UI Emoji";
    }

    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family:var(--sans);
      color:var(--text);
      background:
        radial-gradient(1200px 700px at 20% -10%, rgba(255,255,255,.08), transparent 55%),
        radial-gradient(900px 600px at 90% 10%, rgba(255,255,255,.06), transparent 60%),
        radial-gradient(800px 800px at 50% 110%, rgba(255,255,255,.05), transparent 55%),
        linear-gradient(180deg, #050505 0%, #070707 50%, #050505 100%);
      overflow-x:hidden;
    }

    /* subtle grain */
    body::before{
      content:"";
      position:fixed; inset:0;
      background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='180' height='180'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.8' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='180' height='180' filter='url(%23n)' opacity='.25'/%3E%3C/svg%3E");
      mix-blend-mode:overlay;
      opacity:.12;
      pointer-events:none;
      z-index:-1;
    }

    a{color:inherit; text-decoration:none}
    .wrap{max-width:var(--max); margin:0 auto; padding:28px 18px 56px;}
    .nav{
      position:sticky; top:0;
      backdrop-filter: blur(14px);
      background: linear-gradient(180deg, rgba(7,7,7,.85), rgba(7,7,7,.55));
      border-bottom:1px solid var(--line);
      z-index:10;
    }
    .nav-inner{max-width:var(--max); margin:0 auto; padding:14px 18px; display:flex; align-items:center; justify-content:space-between; gap:14px;}
    .brand{
      display:flex; align-items:center; gap:10px; letter-spacing:.22em;
      text-transform:uppercase; font-weight:700;
    }
    .sigil{
      width:12px; height:12px; border:1px solid rgba(255,255,255,.55);
      transform:rotate(45deg);
      box-shadow:0 0 22px var(--glow);
    }
    .links{display:flex; gap:16px; align-items:center; flex-wrap:wrap; justify-content:flex-end}
    .link{
      font-family:var(--mono);
      font-size:12px;
      letter-spacing:.12em;
      color:var(--muted);
      padding:8px 10px;
      border-radius:999px;
      border:1px solid transparent;
      transition: all .2s ease;
    }
    .link:hover{
      color:var(--text);
      border-color:var(--line);
      background:rgba(255,255,255,.03);
    }

    .hero{padding:56px 0 10px;}
    .hero-grid{display:grid; grid-template-columns: 1.35fr .65fr; gap:18px; align-items:stretch;}
    @media (max-width: 900px){ .hero-grid{grid-template-columns:1fr} }

    .card{
      border:1px solid var(--line);
      background: linear-gradient(180deg, var(--panel), rgba(255,255,255,.02));
      border-radius:var(--radius);
      box-shadow:var(--shadow);
      overflow:hidden;
    }
    .card.pad{padding:22px}
    .kicker{
      font-family:var(--mono);
      color:var(--muted);
      font-size:12px;
      letter-spacing:.18em;
      text-transform:uppercase;
    }
    h1{
      margin:12px 0 10px;
      font-size: clamp(40px, 6vw, 72px);
      line-height:1.02;
      letter-spacing:.08em;
      text-transform:uppercase;
    }
    .sub{
      color:var(--muted);
      font-size:15px;
      line-height:1.7;
      max-width:62ch;
    }
    .cta-row{display:flex; gap:12px; flex-wrap:wrap; margin-top:18px}
    .btn{
      display:inline-flex; align-items:center; justify-content:center; gap:10px;
      padding:12px 14px;
      border-radius:14px;
      border:1px solid var(--line);
      background:rgba(255,255,255,.04);
      color:var(--text);
      font-family:var(--mono);
      letter-spacing:.12em;
      text-transform:uppercase;
      font-size:12px;
      transition: transform .15s ease, background .15s ease, border-color .15s ease;
      cursor:pointer;
      user-select:none;
    }
    .btn:hover{transform: translateY(-1px); background:rgba(255,255,255,.06); border-color:rgba(255,255,255,.18)}
    .btn.primary{
      background:linear-gradient(180deg, rgba(255,255,255,.10), rgba(255,255,255,.04));
      border-color:rgba(255,255,255,.22);
    }
    .btn.primary:hover{background:linear-gradient(180deg, rgba(255,255,255,.14), rgba(255,255,255,.06))}
    .dot{width:6px; height:6px; border-radius:50%; background:rgba(255,255,255,.65); box-shadow:0 0 16px rgba(255,255,255,.20)}

    .side{
      display:flex; flex-direction:column; justify-content:space-between; gap:12px;
    }
    .stat{
      padding:18px;
      border-top:1px solid var(--line);
      background:linear-gradient(180deg, rgba(255,255,255,.03), transparent);
    }
    .stat:first-child{border-top:none}
    .stat .label{font-family:var(--mono); font-size:11px; letter-spacing:.16em; color:var(--muted); text-transform:uppercase}
    .stat .value{margin-top:8px; font-size:18px; letter-spacing:.06em}
    .divider{height:1px; background:var(--line); margin:22px 0}
    .grid{
      display:grid;
      grid-template-columns:repeat(12, 1fr);
      gap:14px;
      margin-top:18px;
    }
    .col-7{grid-column:span 7}
    .col-5{grid-column:span 5}
    .col-4{grid-column:span 4}
    .col-6{grid-column:span 6}
    .col-12{grid-column:span 12}
    @media (max-width: 900px){
      .col-7,.col-5,.col-6,.col-4{grid-column:span 12}
    }

    h2{
      margin:0 0 8px;
      letter-spacing:.12em;
      text-transform:uppercase;
      font-size:18px;
    }
    .p{color:var(--muted); line-height:1.75; font-size:14px; margin:0}
    .tagrow{display:flex; flex-wrap:wrap; gap:10px; margin-top:14px}
    .tag{
      font-family:var(--mono);
      font-size:11px;
      letter-spacing:.14em;
      text-transform:uppercase;
      color:rgba(255,255,255,.72);
      border:1px solid var(--line);
      background:rgba(255,255,255,.03);
      padding:8px 10px;
      border-radius:999px;
    }

    .form{
      display:flex; gap:10px; flex-wrap:wrap; align-items:center;
      margin-top:14px;
    }
    input{
      flex:1;
      min-width:220px;
      padding:12px 12px;
      border-radius:14px;
      border:1px solid var(--line);
      background:rgba(0,0,0,.22);
      color:var(--text);
      outline:none;
      font-family:var(--sans);
    }
    input::placeholder{color:rgba(255,255,255,.40)}
    input:focus{border-color:rgba(255,255,255,.22); box-shadow:0 0 0 4px rgba(255,255,255,.05)}

    .footer{
      margin-top:34px;
      padding-top:18px;
      border-top:1px solid var(--line);
      display:flex;
      justify-content:space-between;
      gap:14px;
      flex-wrap:wrap;
      color:var(--muted);
      font-family:var(--mono);
      font-size:11px;
      letter-spacing:.12em;
      text-transform:uppercase;
    }

    .muted{color:var(--muted)}
    .tiny{font-size:11px}
    .mono{font-family:var(--mono)}
  </style>
</head>

<body>
  <!-- NAV -->
  <div class="nav">
    <div class="nav-inner">
      <a class="brand" href="#top" aria-label="RITUAL X Home">
        <span class="sigil" aria-hidden="true"></span>
        <span>RITUAL X</span>
      </a>

      <div class="links">
        <a class="link" href="#about">ABOUT</a>
        <a class="link" href="#drop">DROP</a>
        <a class="link" href="#contact">CONTACT</a>
        <!-- EDIT THESE -->
        <a class="link" href="https://instagram.com/yourhandle" target="_blank" rel="noreferrer">IG</a>
        <a class="link" href="https://tiktok.com/@yourhandle" target="_blank" rel="noreferrer">TT</a>
      </div>
    </div>
  </div>

  <main id="top" class="wrap">
    <!-- HERO -->
    <section class="hero">
      <div class="hero-grid">
        <div class="card pad">
          <div class="kicker">CLEAN. DARK. UNDERGROUND.</div>
          <h1>RITUAL X</h1>
          <p class="sub">
            Limited drops. Heavy blanks. Minimal graphics. No loud branding.
            Built for nights, basements, and backrooms — but finished like a real label.
          </p>

          <div class="cta-row">
            <a class="btn primary" href="#drop"><span class="dot"></span> VIEW DROP</a>
            <a class="btn" href="#contact">JOIN LIST</a>
            <!-- EDIT THIS -->
            <a class="btn" href="https://your-ticket-link.com" target="_blank" rel="noreferrer">TICKETS</a>
          </div>

          <div class="divider"></div>

          <div class="tagrow">
            <span class="tag">LIMITED</span>
            <span class="tag">CUT & SEW LATER</span>
            <span class="tag">HEAVYWEIGHT</span>
            <span class="tag">NO RESTOCKS</span>
          </div>
        </div>

        <div class="card side">
          <div class="stat">
            <div class="label">STATUS</div>
            <div class="value">DROP 001 — SOON</div>
            <div class="p tiny">Sign up to get first access.</div>
          </div>
          <div class="stat">
            <div class="label">LOCATION</div>
            <div class="value">AUSTIN / ONLINE</div>
            <div class="p tiny">Pop-ups + web drops.</div>
          </div>
          <div class="stat">
            <div class="label">RULE</div>
            <div class="value">NO NOISE</div>
            <div class="p tiny">If you know, you know.</div>
          </div>
        </div>
      </div>
    </section>

    <!-- INFO GRID -->
    <section class="grid">
      <div id="about" class="card pad col-7">
        <h2>About</h2>
        <p class="p">
          RITUAL X is a clothing project built around restraint. Dark tones, clean silhouettes,
          and details that only show up when you’re close. Every release is a ritual: limited,
          intentional, and gone when it’s gone.
        </p>
        <div class="tagrow">
          <span class="tag">STREET</span>
          <span class="tag">UNDERGROUND</span>
          <span class="tag">MINIMAL</span>
          <span class="tag">MYSTERY</span>
        </div>
      </div>

      <div class="card pad col-5">
        <h2>Code</h2>
        <p class="p">
          Wear it like a uniform. No explaining. No flexing. Just presence.
        </p>
        <div class="divider"></div>
        <p class="p tiny mono">
          “RITUAL X” is a label, not a logo. The work speaks.
        </p>
      </div>

      <div id="drop" class="card pad col-6">
        <h2>Drop 001</h2>
        <p class="p">
          First release is kept simple: one silhouette, one graphic system, two colorways.
          Heavyweight fabric. Tight quantities. No restock.
        </p>
        <div class="divider"></div>
        <p class="p tiny">
          <span class="muted">Expected:</span> January 2026<br/>
          <span class="muted">Pieces:</span> Tee / Hoodie (limited run)
        </p>
        <div class="cta-row" style="margin-top:14px">
          <a class="btn primary" href="#contact"><span class="dot"></span> GET ACCESS</a>
          <!-- EDIT THIS -->
          <a class="btn" href="https://instagram.com/yourhandle" target="_blank" rel="noreferrer">SEE UPDATES</a>
        </div>
      </div>

      <div class="card pad col-6">
        <h2>Authenticity</h2>
        <p class="p">
          If you copy what everyone does, you’ll sell like everyone sells.
          Keep the visuals consistent. Keep the drops scarce. Keep the tone cold.
        </p>
        <div class="divider"></div>
        <p class="p tiny">
          <span class="muted">Policy:</span> All sales final on limited drops (optional).<br/>
          <span class="muted">Shipping:</span> 3–7 business days after drop closes (optional).
        </p>
      </div>

      <div id="contact" class="card pad col-12">
        <h2>Join the list</h2>
        <p class="p">
          Get drop access + location updates. No spam.
        </p>

        <!-- OPTION A (no backend): opens email -->
        <!-- EDIT the email -->
        <form class="form" action="mailto:youremail@domain.com" method="post" enctype="text/plain">
          <input name="email" type="email" placeholder="you@email.com" required />
          <button class="btn primary" type="submit"><span class="dot"></span> JOIN</button>
          <a class="btn" href="mailto:youremail@domain.com?subject=RITUAL%20X%20-%20Contact">EMAIL</a>
        </form>

        <p class="p tiny" style="margin-top:10px">
          Prefer DMs? Hit the socials.
          <!-- EDIT THESE -->
          <a class="mono" href="https://instagram.com/yourhandle" target="_blank" rel="noreferrer">Instagram</a>
          <span class="muted">/</span>
          <a class="mono" href="https://tiktok.com/@yourhandle" target="_blank" rel="noreferrer">TikTok</a>
        </p>
      </div>
    </section>

    <div class="footer">
      <div>© <span id="y"></span> RITUAL X</div>
      <div class="muted">LIMITED DROPS • NO RESTOCKS • AUSTIN / ONLINE</div>
    </div>
  </main>

  <script>
    document.getElementById("y").textContent = new Date().getFullYear();
  </script>
</body>
</html>
