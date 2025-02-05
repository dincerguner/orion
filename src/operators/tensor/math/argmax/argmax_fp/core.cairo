use orion::numbers::fixed_point::core::{FixedType, FixedImpl};
use orion::operators::tensor::core::Tensor;
use orion::operators::tensor::math::argmax::argmax_fp::fp8x23;
use orion::operators::tensor::math::argmax::argmax_fp::fp16x16;

/// Cf: TensorTrait::argmax docstring
fn argmax(
    self: @Tensor<FixedType>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
) -> Option<Tensor<usize>> {
    match *self.extra {
        Option::Some(extra_params) => match extra_params.fixed_point {
            Option::Some(fixed_point) => match fixed_point {
                FixedImpl::FP8x23(()) => Option::Some(
                    fp8x23::argmax(self, axis, keepdims, select_last_index)
                ),
                FixedImpl::FP16x16(()) => Option::Some(
                    fp16x16::argmax(self, axis, keepdims, select_last_index)
                ),
            },
            Option::None(_) => Option::Some(
                fp16x16::argmax(self, axis, keepdims, select_last_index)
            ),
        },
        Option::None(_) => Option::Some(fp16x16::argmax(self, axis, keepdims, select_last_index)),
    }
}
