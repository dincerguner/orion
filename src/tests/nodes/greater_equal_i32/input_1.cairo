use array::ArrayTrait;
use orion::operators::tensor::core::{TensorTrait, Tensor, ExtraParams};
use orion::numbers::fixed_point::core::FixedImpl;
use orion::operators::tensor::implementations::impl_tensor_i32::Tensor_i32;
use orion::numbers::signed_integer::{integer_trait::IntegerTrait, i32::i32};

fn input_1() -> Tensor<i32> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(3);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 1, sign: true });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 2, sign: true });
    data.append(i32 { mag: 1, sign: true });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 1, sign: true });
    data.append(i32 { mag: 1, sign: true });
    data.append(i32 { mag: 2, sign: true });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 1, sign: true });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 2, sign: true });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 3, sign: true });
    data.append(i32 { mag: 3, sign: true });

    let extra = ExtraParams { fixed_point: Option::Some(FixedImpl::FP16x16) };
    TensorTrait::new(shape.span(), data.span(), Option::Some(extra))
}