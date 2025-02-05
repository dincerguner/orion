# tensor.onehot

```rust 
   fn onehot(self: @Tensor<T>, depth: usize, axis: Option<usize>, values: Span<usize>) -> Tensor<usize>;
```

Produces one-hot tensor based on input.

## Args

* `self`(`@Tensor<T>`) - The input tensor.
* `depth`(`usize`) - Scalar or Rank 1 tensor containing exactly one element, specifying the number of classes in one-hot tensor.
* `axis`(`Option<bool>`) - Axis along which one-hot representation in added. Default: axis=-1.
* `values`(`Span<usize>`) - Rank 1 tensor containing exactly two elements, in the format [off_value, on_value]   

## Panics

* Panics if values is not equal to 2.

## Returns 

A new `Tensor<T>` one-hot encode of the input tensor.

## Example

```rust
fn onehot_example() -> Tensor<FixedType> {
use array::{ArrayTrait, SpanTrait};

use orion::operators::tensor::core::{TensorTrait, Tensor, ExtraParams};
use orion::operators::tensor::implementations::impl_tensor_u32::{Tensor_u32};
use orion::numbers::fixed_point::core::{FixedType, FixedTrait, FixedImpl};

fn onehot_example() -> Tensor<u32> {
    let tensor = TensorTrait::<u32>::new(
        shape: array![2, 2].span(), 
        data: array![0, 1, 2, 3].span(), 
        extra: Option::None(())
    );

    return tensor.onehot(
        depth: 3, 
        axis: Option::None(()), 
        values: array![0, 1].span()
    );
}
>>> [[1. 0. 0.]
     [0. 1. 0.]
     [0. 0. 1.]]
```
