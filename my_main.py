import torch

torch.manual_seed(42)
x = torch.randn(5)
print(f"{x=}")
print(f"{x.mean()=}")
