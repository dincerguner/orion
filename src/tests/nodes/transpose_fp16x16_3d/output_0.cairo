use array::ArrayTrait;
use orion::operators::tensor::core::{TensorTrait, Tensor, ExtraParams};
use orion::numbers::fixed_point::core::{FixedTrait, FixedType, FixedImpl};
use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;

fn output_0() -> Tensor<FixedType> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(2);
    shape.append(2);
    shape.append(2);

    let mut data = ArrayTrait::new();
    data.append(FixedType { mag: 2621440, sign: false });
    data.append(FixedType { mag: 6553600, sign: true });
    data.append(FixedType { mag: 7012352, sign: true });
    data.append(FixedType { mag: 3866624, sign: true });
    data.append(FixedType { mag: 3080192, sign: false });
    data.append(FixedType { mag: 1900544, sign: false });
    data.append(FixedType { mag: 5111808, sign: true });
    data.append(FixedType { mag: 2686976, sign: false });

    let extra = ExtraParams { fixed_point: Option::Some(FixedImpl::FP16x16) };
    TensorTrait::new(shape.span(), data.span(), Option::Some(extra))
}