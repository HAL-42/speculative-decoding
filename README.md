# 投机采样：让大模型一次多走几步

[在线学习](https://hal-42.github.io/speculative-decoding/)

面向具备基础概率论与 LLM 知识的读者，以“动机 → 直觉 → 心智模型 → 算法与证明 → 性能边界”讲解 Speculative Decoding。视觉表达受 3Blue1Brown 启发，是独立制作的中文交互式学习笔记，与其无隶属关系。

## 学习内容

- 逐 token 解码为什么存在串行等待，以及小 batch 下的访存瓶颈。
- 因果掩码与多个位置的并行验证。
- 接受连续前缀、首个拒绝处纠正、全部接受后的额外 token。
- 接受概率、残差分布、概率质量守恒证明与总变差距离。
- 随机采样、贪心、temperature / top-k / top-p 与 KV cache。
- 简化加速模型、独立性假设与真实系统开销。

## 七个互动

时序动画、因果矩阵、三种逐步验证轨迹、可调概率面积、正确与错误规则的蒙特卡洛比较、加速比曲线、理解测验。

概率实验在浏览器内运行，使用四个抽象 token 和可复现伪随机数；不调用真实模型。时序与性能曲线为明确标注的教学模型，不是硬件 benchmark。

## 本地使用

直接打开 `index.html`，或运行：

```sh
python3 -m http.server 8766 --bind 127.0.0.1
```

然后访问 `http://127.0.0.1:8766/`。页面为单文件 HTML，样式、SVG、公式和脚本均内置，没有字体、CDN 或构建依赖，可保存后离线使用。支持手机布局、键盘交互与减少动态效果偏好。

## 发布

GitHub Pages 从 `main` 分支根目录发布。提交后推送即可触发部署；可使用 `bash deploy.sh`。该脚本只暂存网页相关文件，不包含本机工具配置。

## 资料

主要依据 Leviathan et al., *Fast Inference from Transformers via Speculative Decoding*（ICML 2023）和 Chen et al., *Accelerating Large Language Model Decoding with Speculative Sampling*（2023），并参考 Google Research、Hugging Face、vLLM 官方资料。八项完整参考资料及对应链接见页面底部。

本页统一使用 **p = 目标分布，q = 草稿实际采样分布**。资料核对日期：2026-10-12。
