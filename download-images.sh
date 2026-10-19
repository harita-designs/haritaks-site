#!/bin/bash
# Downloads the full-size originals (homepage + case studies) from the live Framer site into assets/originals/
# (the site itself uses the compressed .webp copies in assets/images/)
# Run once from this folder:  bash download-images.sh
# Do this BEFORE your Framer plan ends.

ROOT="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$(dirname "$0")/assets/originals"
cd "$(dirname "$0")/assets/originals" || exit 1
base="https://framerusercontent.com/images"

# Skips anything already downloaded, so re-running only fetches new files
get() {
  if [ -s "$1" ]; then echo "• $1 already downloaded"; return; fi
  if curl -sSfL -o "$1" "$base/$2"; then echo "✓ $1"; else echo "✗ $1 failed"; rm -f "$1"; fi
}

get portrait.jpeg            kwKDXHEkiRafqc3S6njbr3CdYaA.jpeg
get portrait-mobile.jpeg     RLYxYgwY3G16VKcUxvSUgdoQM.jpeg
get work-ml.png              ScXZe4KEsYjvuua0QUrsoUDLev4.png
get work-risklens.png        L7QP4AJzhBrvObChHTJXSzXoMs.png
get work-vtech.jpg           wlIROng5cdQyFWNo1CA3qfIXpio.jpg
get work-cardiac.jpg         YPmSmA9u5ge1U1SjPGEs7feAA.jpg
get beyond-bg.jpg            FbIkY32TVY9QHluJLzCkHLnBvh0.jpg
get card-visual-design.png   iWNvYE3rXDfA08nM8lab6rmUEI.png
get card-photography.png     U9dgMcpIxlYAyJso1H9HHBe2v4k.png
get card-art.png             ptLYN3bI8Lv7lQGpYtSLqU1Ag.png
# homepage project images Framer swaps in on tablet / mobile
get work-ml-alt.png          tdA1Irn4XDV276iFegR28SowDcM.png
get work-risklens-tablet.png 7YYq7ryAQpRoaIqt1lGRDPOCZ9w.png
get work-risklens-mobile.png EHQBbgs8wDjSyMCs9bqkpIqHL6Q.png

# ---------- Case study: Livr / ML decision-support ----------
mkdir -p ml && cd ml || exit 1
get ml-hero.png              1kquJoSPIdHVsXg0pq3jMo5srQ.png
get ml-after.png             9soyTatgYdktQx41v7H7ZF1DZs8.png
get ml-problem.png           PuJrRHaUYU9fnfTRMZyC674cE.png
get ml-quote.png             mVTdKKs83GylY47DM1TSrw1uiBY.png
get ml-outcome-banner.png    6YtukI4pNoX5a9XkpHh61faE8w.png
get ml-final.png             bM1X4jfINt1JoFlQifguBZlC4k.png
vbase="https://framerusercontent.com/assets"
getv() {
  if [ -s "$1" ]; then echo "• $1 already downloaded"; return; fi
  if curl -sSfL -o "$1" "$vbase/$2"; then echo "✓ $1"; else echo "✗ $1 failed"; rm -f "$1"; fi
}
getv ml-before.mp4           hYHSfQqf3DTytsDJbWRsgOVNH0o.mp4
getv ml-interpretation.mp4   UZRAnVP9vkHf9hT2WzuvdRyNc.mp4
getv ml-caseload.mp4         ormklidqQdcMuEWQvg5zDXojup0.mp4
getv ml-action.mp4           T0eCEPuchzgAWT4Vr6J9VZSM.mp4
getv ml-trust.mp4            ptTJZSWinaDSrkCEiG1s1BDIzWo.mp4
getv ml-landing.mp4          3Nfq9toIYsQDZSKTo2TXkAru0.mp4
cd ..

# ---------- Case study: RISKLens ----------
mkdir -p risklens && cd risklens || exit 1
get rl-hero.png              RnCsmPKkDikib9O2ykXxSgALM.png
get rl-sketch.png            NPFKfHhtYM1YByOthvt12OaIqU.png
get rl-stitch.png            XhGeDF6tAC2hznyWgejITkzO0T4.png
get rl-lofi.png              XkTtMX4nohEwtcJ7JWSWrObG2cE.png
get rl-hifi.png              wXVetJbpuwe11lDVvHM1W2yzWv0.png
get rl-early.png             fgru9pyPLNFbjlOpPQK1tZCYXDE.png
get rl-refined.png           55qSlo2XyEJNJIC3JpZ4JlIp2No.png
get rl-figma.png             go51AX6IirU9jbW0U02j4rEItDY.png
get rl-claude.png            cu4MfUe9qRDMpZkhNA7m7eIhaM.png
get rl-github.png            WSSA3kHm3ECIOykZSnR4G6zY7QA.png
get rl-vercel.png            BCptqT7W5uQelXInbMoaBLrvaM.png
get rl-live.png              6Mbk8Ho1Hueks5KUT5R4bkdztv0.png
getv rl-portfolio.mp4        zZKJOvmKje6TGHTUv5rvsPduo4E.mp4
getv rl-workspace.mp4        fvwFJFBqafwzHy6wwpyjgg2ptfw.mp4
cd ..

# ---------- Case study: VTech ----------
mkdir -p vtech && cd vtech || exit 1
get vt-hero.jpg          PxcH660okjxyXTvOIbjZmzwzRM.jpg
get vt-glyph.jpg         ezYZRdqanx7zxWIpgVBodAXwXQ.jpg
get vt-angle.png         vaKV5hTUpHMKHABFAbFTAfWcbDo.png
get vt-colors.png        fdFLTqTXZ96jGRFVaIX8UDlashM.png
get vt-strip.png         yohB4IdfZPDjNXThKLVcfoMic.png
get vt-grid.png          iqHf7LqCPrracNsoxjlKhU8A.png
get vt-app1.jpg          wUobPrOwnD9RGhGQRawrtpgZU.jpg
get vt-app2.jpg          AOsnu1cbtpfSVVMGjNXBqwGk.jpg
get vt-app3.jpg          FqoHMXUiwC1JZWM7tUtcnFMTuoo.jpg
get vt-app4.jpg          udGrrdo80mvymkUJl5pQ3XgXCAo.jpg
get vt-app5.jpg          bYFxylDRT1N8SXCPOLK897wt0mg.jpg
get vt-app6.jpg          P5q66QIrnqdkPpBlzz909d9u1I.jpg
get vt-app7.jpg          6qayAG0ose4a8avoYksLHAQ.jpg
get vt-app8.jpg          M2VKtiZmDEgO5snsYcYv9Wje1c.jpg
get vt-app9.jpg          7ULV6K6W7GFq7zPf4i4UGjvk.jpg
get vt-app10.jpg         ihx9zQrTmfmqMRLNMqwtrh6Bo.jpg
get vt-app11.jpg         mYHuS0EjCADFgfczbxpv0HTetDc.jpg
get vt-impact.jpg        CTn7u8wZmXr9CU5bYMFctNDzc.jpg
getv vt-intro.mp4        xXp16hWwIAycRCjDx4Bb2KdnD0.mp4
getv vt-logo-anim.mp4    Uq4vx3sMq7vawhgjC9uMnu5qc.mp4
getv vt-found1.mp4       HOAxL9qNIGGaQeaOS41yCJeb8.mp4
getv vt-found2.mp4       2c991pwLOYkVQfvI1619o55tkds.mp4
getv vt-found3.mp4       d0W5RmREkMjk0ZqOxj07XspO4g.mp4
getv vt-scale1.mp4       OaU6J1TrZqNkTLzpA9KdOXtB8M.mp4
getv vt-scale2.mp4       jxYnsBjRbHWN1c6sl00KlOOLdE.mp4
getv vt-states.mp4       z3bsVmYsxOe07ZEMGW7bA37HWA8.mp4
getv vt-type1.mp4        jGDX66cMfZ8Krs7aRtSwK4lcg.mp4
getv vt-type2.mp4        TDVnstEPYwC5dNJ0ec9jkT2TM.mp4
getv vt-a11y1.mp4        t8ZhLg4HNgruH19NXrrOLgF4KCQ.mp4
getv vt-a11y2.mp4        louZ3Ph3hW9DBfCcXWV0wnAJ6o.mp4
getv vt-comp1.mp4        1vPjomkTdouIpesik56SKr13mac.mp4
getv vt-comp2.mp4        Ed6zw4u7DN8CAM9Izzjubihk.mp4
getv vt-comp3.mp4        Np4BsCs2E0f25Y4tq9dgBlSKcE.mp4
getv vt-comp4.mp4        dX6WqLl4ZZbh9nxBXpIpEubk.mp4
getv vt-comp5.mp4        CE3PknfLn3Yl2Uy3gJo9buef0.mp4
getv vt-comp6.mp4        Nv8OLY9pvknaz4pPqyTci64EQ.mp4
getv vt-comp7.mp4        8x6xnB7JWrVd33X7Z1Eb0thEFM.mp4
getv vt-comp8.mp4        wvPtDRzJeku2t7AzkL9LCp8fOg.mp4
cd ..

# ---------- Case study: Cardiac arrest monitoring (IoT) ----------
mkdir -p cardiac && cd cardiac || exit 1
get ca-hero.jpg          YPmSmA9u5ge1U1SjPGEs7feAA.jpg
get ca-paper.png         P6RdMRjIO9NA3qMo7NS7FlZlZK8.png
get ca-arch.png          ti8AM4WGeCDJH1Tq5TtaeQLZQQU.png
get ca-proto1.jpg        iSYng49xrr0efNUp85iObNW64.jpg
get ca-proto2.png        un4Pt0Rb0sD3BobliZfMkdyoTVA.png
get ca-story1.png        WtAeYYM34muTrbKnlggSGAODL24.png
get ca-story2.png        dbgiU91laX0HAfwJwkmaWxCWbA.png
get ca-story3.png        WhUxNvcxbJ0KHwe6g9u66i97gII.png
get ca-story4.png        PjiqsTYCTiDhvC67Uzf9BgUyU.png
get ca-story5.png        LT1dCOwvIGtymQGl4b4dNq6ZA0.png
get ca-story6.png        nyC7P23gWpXyaK3ox9VNlqdG0gU.png
get ca-story7.png        3MGvsG0VaNmd28MrSLWZL8pgpE.png
get ca-story8.png        aEG4lguB1gTJsye1r7snfmHdKs.png
get ca-story9.png        PFDubF00uKX32ebkcPXFAhyKHB8.png
get ca-story10.png       epLa3UxpEK3prff6ajAyR7s5w.png
get ca-mesh.png          xjsQYogRQK5McLjQHJQpSLoA68.png
get ca-module.png        DYPRSnahYyb0kwidZLI7IaIcE.png
get ca-exploded.png      SBONHPqDifVTxfUyxNeKl8RdVs.png
get ca-components.png    wmNxUwlrT9RTEfOlPEUfXAdYmA.png
get ca-charging.png      YPS0dF57lwMT3VhT4JRlVmm6k.png
get ca-final.png         LVT0St7k2bfZqEnEVjHOaxpqP8M.png
cd ..

# ---------- Visual design (gallery page) ----------
mkdir -p visual-design && cd visual-design || exit 1
get vd-book.jpg          LEscvL45bRC1y63Y939XJm5MuMU.jpg
get vd-flyer.jpg         RdATPwochzi33pOh1S4j4VtRovQ.jpg
get vd-newspaper.jpg     rnIxIjqerDbjpg9nVPMVHBcTyg.jpg
get vd-textile.jpg       uwTIGwsd9KXFhj5aJOgGs1psvs.jpg
cd ..

# ---------- Visual design: book-redesign ----------
mkdir -p book-redesign && cd book-redesign || exit 1
get bk-hero.jpg          LEscvL45bRC1y63Y939XJm5MuMU.jpg
get bk-before1.png       N9vnzRclb6nod5Y9HgWSWl1TBAQ.png
get bk-before2.png       2yv36TJ789YhY6IwHZk46XsWw.png
get bk-before3.png       0tBiHNTiAfGSlgexxUZTt3no.png
get bk-after1.png        5rs3UbN8wIXIfKCvXoGuacpKU0.png
get bk-after2.png        gVXp65VHXwgbtq6s1I9EAWm4xvQ.png
get bk-after3.png        H2UFjPUESaoStPvp8vOEIgbgD4.png
get bk-01.png            0l5GgMGnOrw7njT1ohXiXU7PPtc.png
get bk-02.png            zVymtMousE5PYlZBfnpe2Oyr7n4.png
get bk-03.png            bSWKijacBeZkn57ihy6X0956Hw.png
get bk-04.png            Uiyo4lNhcUJ1SzShsPdGzFVt0b0.png
get bk-05.png            PCfqsIcJ6pdzmcXYbiXiZXcU9JE.png
get bk-06.png            040KkdiyRr55cEP1cZDTZS1zs.png
get bk-07.png            4c7ntRHkzONzVeA4vMMkg6erkqY.png
get bk-08.jpg            6iQFYEBfdl5oyAY0g2srkhUaAg.jpg
get bk-09.jpg            s9Zm2sFUNrzvnGV78eTHgdas5w.jpg
get bk-10.jpg            X7KFdhoKfP76bZ9jZLMZitp36z0.jpg
cd ..

# ---------- Visual design: flyer-design ----------
mkdir -p flyer-design && cd flyer-design || exit 1
get fl-hero.jpg          RdATPwochzi33pOh1S4j4VtRovQ.jpg
get fl-01.png            5zp00ZN7FX56D6VGcrlafVuY.png
get fl-02.png            DDULRhJtGI0RXnTtAoHTWOgCg.png
get fl-03.png            3ezKlAPebLjphMfsBTytrZ5cCk.png
get fl-04.png            66FCQxUc2kDHeYYvIa4Ralbjw.png
get fl-05.jpg            X5DRMOIoLJiYWVfiHk2Qp0KgUFs.jpg
get fl-06.jpg            ugUmBCETB1yYciDTQCFkft4nyFQ.jpg
get fl-07.jpg            inKwRwVaXHC9IEpavMOlKsQ5pR0.jpg
get fl-08.jpg            FB802KWdxdlDVBsADAwRE9APjU.jpg
cd ..

# ---------- Visual design: newspaper-redesign ----------
mkdir -p newspaper-redesign && cd newspaper-redesign || exit 1
get np-hero.jpg          rnIxIjqerDbjpg9nVPMVHBcTyg.jpg
get np-before1.png       eXeOy7DjYwSZj3DZqEaTvHiQpY.png
get np-before2.png       0LQUZy7END08JlGkaZMazh6jz1s.png
get np-after1.png        hqc4lZDB7JvMZMHO4N0UbssuwQ4.png
get np-after2.png        gGLfxKGXheXah9EpmzrDA860A.png
get np-wide.png          JBcp4CwOZyJ8NFxKJk7K2x6Kwk.png
get np-01.png            B4ifsVrk2MmgFSfe2scs1cKxkJ8.png
get np-02.png            LLzTD2rgfjfoLsOqouv9L8XpvQ.png
get np-03.png            XvtsHfGks8AswoQefrpPfs8UZ3Y.png
get np-04.png            htFHkPJ9uKZhdZMIYHtyl3xGphw.png
get np-05.png            4tlmx7L0vJxnqj65BsxbfZnWrPo.png
get np-06.png            pHpzEaPlkMBjciqqKeg0PLypaRI.png
get np-07.png            NoV9IrNQGDg9g6JHrkoQxYU7SI.png
get np-08.png            HWoK9HLlNLrMjRTTlFEEQxn3K2A.png
get np-09.png            R7EOgidcca1jm8aIaAkZYckNbVo.png
get np-10.jpg            ppG6b9JWvWyjlaBWZn1FJ3PuDu4.jpg
get np-11.png            TDkrE0JelMmdfj2NbAlLTKraNM.png
get np-12.jpg            kqt2OnRhS8TBRqS9FOIqlcFOdU.jpg
get np-13.jpg            wzlxias7mums9cpgom1YffbldK8.jpg
get np-end.jpg           aBZNaSXXMDCc1PjRrtjRjqLzwI.jpg
cd ..

# ---------- Visual design: textile-design ----------
mkdir -p textile-design && cd textile-design || exit 1
get tx-hero.jpg          hZU68ullCjDhp9VwNj1aa0TA0fk.jpg
get tx-01.png            yJfRfxoUTshdelojNLYdnqYRoXw.png
get tx-02.png            Zj5rGpaW9x1StWi9OkQ8ycfeXg.png
get tx-03.png            AVqMOozMtUCcS9RT0eietpPl2Kc.png
get tx-04.png            8gMvHn306HJYxNkg3qBsgQTUUo0.png
get tx-05.png            nyzE47pHZPeqR4Yz8EO1GnQEpg.png
get tx-06.png            x6UtXNamUl1EngpG9aT78PZc8.png
get tx-07.png            rfsaiIk7SAvFFhW41kcQL6QBl2M.png
get tx-08.png            HBcKxuZb9ggOTMkgGdlfVfnM6w.png
get tx-09.png            r5xQsZGIuwZfbHnjycQdmYwRZ8E.png
get tx-10.jpg            jwLWFa7Muqrj680YC9Se4TAzZVI.jpg
get tx-11.jpg            IiujmlXq2v1Xyp5JHvmtTNVzhAs.jpg
get tx-12.jpg            SyIepGoUbaCi8y6UNRvx6wlK1A.jpg
cd ..

# ---------- Photography gallery (cards) ----------
mkdir -p photography && cd photography || exit 1
get ph-aval.jpg             m12qVG05NX9Wmn4cCLymGXJyO4.jpg
cd ..

# ---------- Photography: aandal-photography ----------
mkdir -p aandal-photography && cd aandal-photography || exit 1
get aa-01.jpg            4GhtcUuFIhm8RCz2zHwF1rZvIO0.jpg
get aa-02.png            fOHz26ODLpV9Dc8WybSoyxg8.png
get aa-03.png            iKMMo3AAQHPebBhT25jLVHUNk.png
get aa-04.jpg            NhovCimFKoXiIjDHRKG6CE336I.jpg
get aa-05.png            feYbd5AkbeX3mB7is0wuQ0B4o0.png
get aa-06.jpg            YGA0cPHAfEcfWk7MnSVbJezSQqA.jpg
get aa-07.png            Ds64ymh797sjybNOnjXmNdxUos.png
get aa-08.png            bVYicvWr8DpJjO1i2mwNdVACsY.png
get aa-09.png            bDq3a3GlznJUaDIIA6n7JOZJG7A.png
get aa-10.png            9RWaZvlS9rjjaG50wIOVRiQXU.png
get aa-11.jpg            tzqpyMFhVsLcvDm0WwcGQA0GMmE.jpg
get aa-12.jpg            EA1WWLIH4SX7ZxNCRHmTboVvI6M.jpg
get aa-13.jpg            tvxfLV5SImuUhO6x52hfaHtPcA.jpg
get aa-14.jpg            pnrQ5O7viCL7j2MBgrhXdkLsE.jpg
get aa-15.png            ufGKv789VjLLtAsy3dpK2MNuxA.png
get aa-16.png            UBvtJO8Nmz9Z0dSGv636MxOCCyM.png
get aa-17.png            xBxFS4VWyTUaSXrlhuOTDAVaE.png
get aa-18.png            S7fLT8fhkVPSdOV000q1TeXw.png
get aa-19.png            o2vTWtiuJrPUe598Jk82VkGLzo.png
get aa-20.png            fBFuIQolp4jRoVO6Heu1vXV65U.png
get aa-21.png            4Pt5TUxV8Iwfkv4hZx6GbnJu3o.png
get aa-22.png            k9XFbhFQhQntDnfJ0F4P51d1AIg.png
cd ..

# ---------- Photography: photo-documentary ----------
mkdir -p photo-documentary && cd photo-documentary || exit 1
get pd-01.png            0fxHYbXjRR20oz9GfpaVYb5BcU.png
get pd-02.png            ikEpqZ1e9LJeD0lCHBAtYCrVRrM.png
get pd-03.png            I7t0eAcyYN11AK0LvWuuKWWwu4s.png
get pd-04.png            RcLoe5GnvCmG26GjRANK9hco3QY.png
get pd-05.png            cnKE8mhiKOCLc9x8ckMT1W3aY.png
get pd-06.png            LL0vnNmUUUTynTWekpGrber9YGk.png
get pd-07.png            CpmgDIxgr8Jlg7n5SxrI37aX40.png
get pd-08.png            Awwvb9s3vhTIITrFYBqllVURlc.png
get pd-09.png            UuFo8hJpf0mKg2mGiUYYQa8yz5Y.png
get pd-10.png            9C11dBJQ4aNDeO8kplxHesvVY0.png
get pd-11.png            7plLqSD4qgZ4EIG2GxYs4E4KGo.png
get pd-12.png            mQgrV4Q26gTDq4m6VcR3an9A2w.png
get pd-13.png            swjP1t5xMDASARiWDUd61mFkpSc.png
get pd-14.png            4rO7JQ9SCIYJCTI8nfI1pyx8g.png
get pd-15.jpg            2YgLskKjjoqva7hfLPzXRrxlAs.jpg
get pd-16.jpg            AIJaOhK6Hov9OPHEDWaB4948yc.jpg
get pd-17.png            9TXgEJc1kao3KaQLFZyMLV5jMhY.png
get pd-18.png            OohNDAUPAk83brV2susDrYKhDhk.png
get pd-19.png            0TUsjPXOg51WtOQBe09HP22FMs.png
get pd-20.png            W6J3UcIESzC4H6UMkTRWlQE.png
get pd-21.png            0XEh5jPsIw3ZCb5w9pAyFcE5Z18.png
get pd-22.png            XC5dgm6qQD4Gwp6UZ5ECuCs.png
get pd-23.png            M0wEKZJk01nlhBqrPPn0U23SG6M.png
cd ..

# ---------- Photography: food-photography ----------
mkdir -p food-photography && cd food-photography || exit 1
get fo-01.png            Z25Ckw5m7gq1xiOkQMcFiJxg.png
get fo-02.jpg            bFmFNJ0AfRfP56QQh0KKM7dzrw.jpg
get fo-03.jpg            Cg56ORgRx2c28sbdmqYso0GxI80.jpg
get fo-04.jpg            qy6muYbRIzYcBDM9h0uMUQ0aOPo.jpg
get fo-05.jpg            8VZku2ovmJNsqDwHRlqghLM.jpg
get fo-06.jpg            Dlm6lF7lStatpSVIwLo3etKSb0.jpg
get fo-07.png            odsD6ip6oigoIwxNmyH8gNMYHPg.png
cd ..

# ---------- Photography: aval ----------
mkdir -p aval && cd aval || exit 1
get av-01.png            NwC4pa0AuC1qPLcV32ICyOnYc9g.png
get av-02.png            Fd3xUQdWr2g15GfFWy9ZIeBfzo.png
get av-03.png            CU4jjy2Yg1qRDr4iF92Dk8TPdQ.png
get av-04.png            xgW5aNCTgWvOwmZeUg5qZYsz5o.png
cd ..

# ---------- Photography: product-photography ----------
mkdir -p product-photography && cd product-photography || exit 1
get pp-01.png            uuoYJl4ShwLHGhiQqYaGchUvA0.png
get pp-02.png            YSoJPVZO96Pve0cphM1G0x2ZmyE.png
get pp-03.png            gJDyLiSYAlXViU6FXQa9YnkwZE.png
get pp-04.png            tIUCdjbOrp3OXeZoNR5386DpI.png
get pp-05.jpg            JtxsqNXctCj8B9SDieNqTvCHDE.jpg
get pp-06.jpg            1rZ2CJ7EiykEofIXzYMMJAOdXQ.jpg
get pp-07.jpg            uygKtErwtOHGCCvM1TvvIOiAodY.jpg
get pp-08.jpg            ulxoTfeWPbu5jefVdZcM7gkY0BY.jpg
get pp-09.jpg            WNOYlKc7RNpC7YD0omTGQjU3Zg.jpg
get pp-10.png            bOWkSCee6HkgzcnwYBh3xFDjgU.png
cd ..

echo "Done. These are backups; the site loads the compressed copies in assets/images and assets/ml"

# ---------- Fonts: the exact Urbanist + Poppins builds the live site uses (Fontshare, via Framer) ----------
cd "$ROOT" || exit 1
mkdir -p assets/fonts && cd assets/fonts || exit 1
fbase="https://framerusercontent.com/third-party-assets/fontshare/wf"
getf() {
  if [ -s "$1" ]; then echo "• $1 already downloaded"; return; fi
  if curl -sSfL -o "$1" "$fbase/$2"; then echo "✓ $1"; else echo "✗ $1 failed"; rm -f "$1"; fi
}
getf urbanist-300.woff2        QAAGQ5CSCHMQMHUVU3ANKG2DM4ZSEBUK/TQHTD2BOTYGZULMVKT6TDONPLV2VTSDA/NMYQXCWCX5IZU2NLFHQJCCO5GNGZUKHY.woff2
getf urbanist-400.woff2        QVSEREMQIHTDJ6PBN6SDKDQRKHAIJM4G/5FQFK3HFEC5ZJORN7EUWWXKPUKR4HDO2/S3LPGNCYQN366TZLSH3ASTPTKANFMFDS.woff2
getf urbanist-400-italic.woff2 QV67EU3XJ5BTJALJXKWL4BK7C3GFGCFP/D7A4U7UFR3LMCTIYWZP4QFWGMT5X6IEF/GQ5MR5RSGVSEH6S242MNYCORRMV5LOZ3.woff2
getf urbanist-500.woff2        RFRIJEFDDNYP2G3SPLVDDAM6LQXTHLSW/F4KOPAGTNOYCQKYEBAKSIKS536ETV6GN/AEP5JZTJJB3JMLBFSBTZLRSVGYD73SDZ.woff2
getf urbanist-600.woff2        NWFQAWEPGN3FR4FYMX6PY5M2HVOQSZWU/IIWY67X24KIURE4HBNGWYFMHSEMIVC2G/QAJFELFQRETRXRXDQOALZZUXNPM2U5VX.woff2
getf urbanist-700.woff2        Y3L2ZYYP26QQ73LRHQEGMGHU7HLMLCIE/5WHYQ3VUOWNEN3Y7DIOEXY5R4W6MYIPF/SS2LIWIFT3QZUKOLJ7TGBEFWHF3TFYQD.woff2
getf poppins-300.woff2         SC7QJW6HNT3W42YFCVAWB3GI66BMNCKY/Q4ANQB6YZL7K35IAB3IPAE75W7PRJSDF/3HCNXVAKPOHOEI7LK7TGC54FOZT77SNM.woff2
getf poppins-400.woff2         NC2MP33RO4WQTSTEEAWBJLAEXNCNEQVF/7F4U3COKLHQH4WUH3AXPC7N4UELEWJQN/JMWNCAGBH3TLANIVQPVABVAVNV5QERTH.woff2
getf poppins-400-italic.woff2  7LLTLAW3NRWOADG4II2JGKZC6OSEMBQC/EYFXWX77PEMPU645EAWOTG22E375GULW/SSNNTU67MMJH4CSWT443B4KJ7OB4WFHF.woff2
getf poppins-700.woff2         EOHGWBZYYKO6R4PWP4S2B3FFWHHBEZN6/UWQLMF4AFWLXCJQCFV3WRVYC77KZXPRB/FYG6OCH7XOLUUSZTIZE65ATBZWF623O4.woff2
getf poppins-700-italic.woff2  JQL34MORONR7D7BXOVTX3KBGJGEJQ5BJ/CKUZVY5SFANCFAT7FS3MP6ZL4BMEWCJE/NOLRWF3JBJ434MILPG5RB6R2B4HGRSZB.woff2

# ---------- Art gallery + its 6 subpages ----------
cd "$ROOT/assets/originals" || exit 1
mkdir -p art && cd art || exit 1
get card-architectural-sketches.jpg   r9tSADXn9SmXFNv9qzeagy18RTI.jpg
get card-paintings.jpg                xS1nvGLhyUkwZjYt8CsZhWEDpI.jpg
get card-sculptural-sketches.jpeg     2PvOmMq9qpI9zwu3pYmMmlus58Q.jpeg
get card-sketches.jpg                 sPcFT8chL1KJrSiQX8FaeCu2KE.jpg
get card-oil-painting.jpg             DvNe0b387m49H5QqzzwSiLgm5G8.jpg
get card-ai-art.png                   dkIsa6oyuXKWDBrHwLP2qm2rBA.png
mkdir -p architectural-sketches && cd architectural-sketches || exit 1
get as-01.jpg   ndMpd7B8Q5T3gYHrZbyMFtnvjY.jpg
get as-02.jpg   76U8KMk8jSPx7obYzqnl7UAcEgo.jpg
get as-03.jpg   8NQxgSi1Ak6DaanGdnEFMtCAC8.jpg
get as-04.jpg   URiQNKiOSXgFiKO7WMsg96u79k.jpg
get as-05.jpg   HkrGDL7IDowx8opkxEXKbKpVVs.jpg
get as-06.jpg   qgzTSCdTrDU7ugcHqBI3Eesxs.jpg
get as-07.jpg   ABHuyHll6503PiJkfYBn217jM.jpg
get as-08.jpg   ZnuaHZzpP6GitEpF6UFS7oRWqI.jpg
cd ..
mkdir -p paintings && cd paintings || exit 1
get pt-01.jpg   paGuYs6ARIbusKWOqNro4CifOY.jpg
get pt-02.jpg   GH62l0CKMaODM0qMqbmVehbiAM.jpg
get pt-03.jpg   XVb3bQktUMxB9RGhlD8iFqf61ko.jpg
get pt-04.jpg   WNpXmJo3SFNFAsy7TsS8JctiE.jpg
get pt-05.jpg   9u8fBNdyeEyu2oI9PEiCvkdLCrg.jpg
get pt-06.jpg   Y9CVU678CsMcVq5nbVHzhz6Rkmk.jpg
get pt-07.jpg   YdEARVbqv9FurpcMKyvpGaxMGLo.jpg
get pt-08.jpg   yMTx4MSvCY71kIIsrGTHhtlwwA.jpg
get pt-09.jpg   E7yx9aeuzQQNWj2yGU4AR66k.jpg
get pt-10.jpg   0dBUOZDn7wAn7ZOgpINef1xw.jpg
get pt-11.jpg   twKxwssKnjMyGjdGiEPltqLl0o.jpg
get pt-12.webp  Q4vxzR2RFykMMRslLPZkwdms7N8.webp
get pt-13.jpg   YTAeBEFVEOpSxHm5uGUxnxFhY.jpg
get pt-14.jpg   quSXr2jfz81W0ZIdcqKxg6vFD0.jpg
get pt-15.jpg   GjU1NmiyaWyArQo2tWSbAXdos.jpg
get pt-16.jpg   h9brXcaK7Jq1dBTBVIY7SxtmM.jpg
get pt-17.jpg   q6MiUB1vycxi8lqt12QV309SvE.jpg
get pt-18.jpg   YuK1czl9NKcxolfCT5FezBOdP0.jpg
get pt-19.jpg   r2dr04nFE1l32gGXJAiD11rBWUc.jpg
get pt-20.jpg   8oUMitVdsJIcN9EaPOLrPXmzsI.jpg
get pt-21.jpg   RdWy8M9svymHqbE12t202mTsmvU.jpg
get pt-22.jpg   g1qNjnA6OcznVIDWjSwRMbLW4L0.jpg
get pt-23.jpeg  S23NSGra99wyuq9IlFuWh8DRjS8.jpeg
get pt-24.jpg   ri5BoptrPsHx3qKqoY9NnKBZU.jpg
get pt-25.jpg   RIuIitrUQyAWDKrUsYM3sS7P5A.jpg
get pt-26.jpg   jTjtDNcoWGuR64mbU9mJfI2iuYY.jpg
cd ..
mkdir -p sculptural-sketches && cd sculptural-sketches || exit 1
get ss-01.jpg   Wn64BfNCeBEHJJjK0MWfA5j6o.jpg
get ss-02.jpeg  Xv7QJokTkMG36cQI18c4G5JyE0.jpeg
get ss-03.jpeg  IQA4xP5NZbCjkQIbrnMtI4DVJOY.jpeg
get ss-04.jpeg  WvofRHZEStb2JNmLtvTqL9UZ4.jpeg
get ss-05.jpeg  S4VWjuTElII4pPfwoYFRpXu0ASo.jpeg
get ss-06.jpeg  zWVbczEa7T9WBanJQqplr9CSQGI.jpeg
get ss-07.jpg   q1978X45JeUrbkMpHS4ovbWfnt4.jpg
get ss-08.jpg   UvCjodIwg3SvcrPLUJ83FskAwAU.jpg
cd ..
mkdir -p sketches && cd sketches || exit 1
get sk-01.jpg   PoF5pBx3I9ABMEkRpBxOEieYJo.jpg
get sk-02.jpg   FbIkY32TVY9QHluJLzCkHLnBvh0.jpg
get sk-03.jpg   0kt5YvRqhfjXHhAF88RRw165Vto.jpg
get sk-04.jpg   0C7GpIqefDLVt1EXPBWPK9lRjhk.jpg
get sk-05.jpg   UrKhLcuPGQ59NJWRh59MvaocMNY.jpg
get sk-06.jpg   3gXhfzyrWQLGMbLabhUD0RfMGc.jpg
get sk-07.jpg   tQagOiA91wBsV8PCkX7jq7JmA.jpg
get sk-08.jpg   HKpMEjFKQnkyZhhoJ1RhziW2dJg.jpg
get sk-09.jpg   9D6ztkS8VEw7zgWPwRGbyGsc.jpg
get sk-10.jpg   p0alD0xuxX8fyVdeMVcnk1XhnM.jpg
get sk-11.jpg   abTn4Pzsl6tHzSDlkvTKKG7boQ.jpg
get sk-12.jpg   ufnNABdMHhRewBQN33FlqE4Xac.jpg
get sk-13.jpg   oebFy6ICX9IzvWcuML8KOGkg30.jpg
get sk-14.jpg   Meu8fafAGkQOiFuLkpTBppt5sQ.jpg
get sk-15.jpg   aCzMkKFIxBAdHdELTsVw9zOJn1s.jpg
get sk-16.jpg   mNFpkPbi0CMybUcfs3HxCcqaHSs.jpg
get sk-17.jpg   U2FXjB6u2oUyUZUy4dClDjF8.jpg
get sk-18.jpg   nigQkIdAtn0fVE6z9MjZj7b6v1Y.jpg
get sk-19.jpg   YZqAfncrLrO5duzSOGukiHcPLrM.jpg
get sk-20.jpg   eF3tJky3VR7ly4mkQlSeAVcQd7o.jpg
get sk-21.jpg   ZF6A0MrLtqE4sMq2hlFVrltywKo.jpg
get sk-22.jpg   b0kpeJqQnjBHvrohMCJF4zaV8A.jpg
cd ..
mkdir -p oil-painting && cd oil-painting || exit 1
get op-01.jpg   zWdTm5cl2Elhk5ut7CAU4rlhw.jpg
get op-02.jpg   RjJRf13oTYFTvzFQAgSXmtuhQ0.jpg
cd ..
mkdir -p ai-art && cd ai-art || exit 1
get ai-01.jpg   it3ITfMzo4J12xW7cFn8OksYss.jpg
get ai-02.png   HOamKTYwxzacyIDl4ewCZtty0cA.png
get ai-03.webp  OyUl6Cwb93IVkVwzwJP92osPw.webp
get ai-04.webp  NotNOhfVsYjKBaPScvJZqiCWxI.webp
get ai-05.png   hSBwDqtjQbWHBPDos2rTDQ7HXM.png
get ai-06.webp  E5jHYxWh1h0DQax7Ke3ciqAEcNQ.webp
cd ..
echo "Art images done."

# ---------- About page ----------
cd "$ROOT/assets/originals" || exit 1
get about-hero.jpeg 5HeRFzc9kNxIyKLIQNnVDrNHYc.jpeg
echo "About image done."
