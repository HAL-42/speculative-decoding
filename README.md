# 投机采样（Speculative Decoding）可视化讲解

一个 3Blue1Brown 风格的单页交互式讲解：从「为什么解码慢」的动机出发，建立「起草 → 验证 → 纠正」的心智模型，再系统推导修正拒绝采样的正确性、加速比公式，并介绍 Medusa、EAGLE、树形验证等变体与工程要点。

- 纯静态单文件 `index.html`，原生 JavaScript + SVG 动画，数学公式由 KaTeX（CDN）渲染。
- 本地预览：直接用浏览器打开 `index.html` 即可。

主要参考：Leviathan et al., *Fast Inference from Transformers via Speculative Decoding* (ICML 2023)；Chen et al., *Accelerating Large Language Model Decoding with Speculative Sampling* (2023)。完整参考文献见页面末尾。
