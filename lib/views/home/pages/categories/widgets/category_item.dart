part of '../view.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
final CategoryModel model;

  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
    required this.onTap, required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            image,
            width: 70.w,
            height: 65.h,
            fit: BoxFit.cover,
            
            // إضافة معالج أخطاء في حال الصورة مش موجودة
            errorBuilder: (context, error, stackTrace) => Container(
              width: 70.w,
              height: 65.h,
              color: Colors.grey[200],
              child: Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff434C6D),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            "assets/icons/arrow-right.svg",
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}