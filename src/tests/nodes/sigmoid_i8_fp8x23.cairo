mod input_0; 
mod output_0; 


use orion::operators::nn::core::NNTrait;
use orion::numbers::fixed_point::core::FixedTrait;
use orion::operators::nn::implementations::impl_nn_i8::NN_i8;
use orion::numbers::fixed_point::implementations::fp8x23::core::FP8x23Impl;
use orion::operators::tensor::implementations::impl_tensor_fp::FP8x23Tensor::FPTensorPartialEq;
use orion::utils::assert_eq;

#[test]
#[available_gas(2000000000)]
fn test_sigmoid_i8_fp8x23() {
    let input_0 = input_0::input_0();
    let z = output_0::output_0();

    let y = NNTrait::sigmoid(@input_0);

    assert_eq(y, z);
}