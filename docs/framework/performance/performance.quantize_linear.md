# performance.quantize_linear

```rust
fn quantize_linear(self: @Tensor<T>, y_scale: @Tensor<T>, y_zero_point: @Tensor<T>) -> Tensor::<Q>;
```

Quantizes a Tensor using linear quantization.

The linear quantization operator. It consumes a high precision tensor, a scale, and a zero point 
to compute the low precision / quantized tensor. The scale factor and zero point must have same shape, 
and can be either a scalar for per-tensor / per layer quantization, or a 1-D tensor for per-axis quantization.
The quantization formula is `y = saturate ((x / y_scale) + y_zero_point)`. For saturation, it saturates to `[-128, 127]`. 
For (x / y_scale), it's rounding to the nearest even.

## Args

* `self`(`@Tensor<T>`) - The input tensor.
* `y_scale`(`@Tensor<T>`) - Scale for doing quantization to get `y`.
* `y_zero_point`(`@Tensor<T>`) - Zero point for doing quantization to get `y`.

## Returns

A new `Tensor<T>` with the same shape as the input tensor, containing the quantized values.

## Examples

```rust
use array::{ArrayTrait, SpanTrait};

use orion::operators::tensor::core::{TensorTrait, Tensor};
use orion::operators::tensor::implementations::impl_tensor_i32::Tensor_i32;
use orion::numbers::signed_integer::i32::{i32, IntegerTrait};
use orion::numbers::signed_integer::i8::i8;
use orion::performance::core::PerfomanceTrait;
use orion::performance::implementations::impl_performance_i32::Performance_i32_i8;

fn quantize_linear_example() -> Tensor<i8> {
    // We instantiate a 1D Tensor here.
    let x = TensorTrait::<i32>::new(
        shape: array![6].span(),
        data: array![
            IntegerTrait::new(0, false),
            IntegerTrait::new(2, false),
            IntegerTrait::new(3, false),
            IntegerTrait::new(1000, false),
            IntegerTrait::new(254, true),
            IntegerTrait::new(1000, true),
        ]
            .span(),
        extra: Option::None(())
    );

    // We instantiate the y_scale here.
    let y_scale = TensorTrait::<i32>::new(
        shape: array![1].span(),
        data: array![IntegerTrait::new(2, false)].span(),
        extra: Option::None(())
    );

    // We instantiate the y_zero_point here.
    let y_zero_point = TensorTrait::<i32>::new(
        shape: array![1].span(),
        data: array![IntegerTrait::new(1, false)].span(),
        extra: Option::None(())
    );

    return x.quantize_linear(@y_scale, @y_zero_point);
}
>>> [1, 2, 2, 127, -126, -128]
```
