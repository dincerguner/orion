use core::traits::Into;
use array::ArrayTrait;
use option::OptionTrait;
use array::SpanTrait;

use orion::numbers::fixed_point::core::{FixedType, FixedTrait};
use orion::numbers::fixed_point::implementations::fp8x23::core::{
    FP8x23Impl, ONE, FP8x23Mul, FP8x23PartialOrd
};
use orion::operators::tensor::implementations::impl_tensor_fp::Tensor_fp;
use orion::operators::tensor::core::{Tensor, TensorTrait};


/// Cf: NNTrait::leaky_relu docstring
fn leaky_relu(z: @Tensor<FixedType>, alpha: @FixedType) -> Tensor<FixedType> {
    assert(*alpha.mag < ONE, 'alpha must be less than 1_fp');

    let mut data_result = ArrayTrait::<FixedType>::new();
    let mut data = *z.data;
    loop {
        if data.len() == 0 {
            break ();
        };

        let current_index = *data.pop_front().unwrap();

        if (current_index >= FixedType { mag: 0, sign: false }) {
            data_result.append(current_index);
        } else {
            data_result.append(current_index * *alpha);
        };
    };

    return TensorTrait::new(*z.shape, data_result.span(), *z.extra);
}

