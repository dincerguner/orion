use array::ArrayTrait;
use orion::operators::tensor::core::{TensorTrait, Tensor, ExtraParams};
use orion::numbers::fixed_point::core::{FixedTrait, FixedType, FixedImpl};
use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;

fn input_0() -> Tensor<FixedType> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(5);

    let mut data = ArrayTrait::new();
    data.append(FixedType { mag: 65536, sign: false });
    data.append(FixedType { mag: 131072, sign: false });
    data.append(FixedType { mag: 196608, sign: false });
    data.append(FixedType { mag: 262144, sign: false });
    data.append(FixedType { mag: 327680, sign: false });

    let extra = ExtraParams { fixed_point: Option::Some(FixedImpl::FP16x16) };
    TensorTrait::new(shape.span(), data.span(), Option::Some(extra))
}