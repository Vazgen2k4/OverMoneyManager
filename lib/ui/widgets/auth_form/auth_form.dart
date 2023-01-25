part of 'auth_form_pakages.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _heightAnimation;
  late final Animation<Radius> _borrderRadiusAnimation;
  late final Animation<Radius> _reverseBorrderRadiusAnimation;

  final _formKey = GlobalKey<FormState>();
  bool _isLoginState = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.defaultTransition,
    );

    final _heightTween = Tween<double>(
      begin: AppConstants.authFormSizeMin.height,
      end: AppConstants.authFormSizeMax.height,
    );

    final _borrderRadiusTween = Tween<Radius>(
      begin: const Radius.circular(AppConstants.borderRadius),
      end: const Radius.circular(AppConstants.borderRadiusBig),
    );

    _heightAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ).drive(_heightTween);

    _borrderRadiusAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ).drive(_borrderRadiusTween);

    _reverseBorrderRadiusAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ).drive(ReverseTween<Radius>(_borrderRadiusTween));
  }

  void _swichForm() {
    _isLoginState = !_isLoginState;

    final _isCompleateAnimation = _animationController.isCompleted;

    _isCompleateAnimation
        ? _animationController.reverse()
        : _animationController.forward();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.hardEdge,
            height: _heightAnimation.value,
            constraints: BoxConstraints(
              minWidth: AppConstants.authFormSizeMin.width,
              maxWidth: AppConstants.authFormSizeMax.width,
            ),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 25,
                ),
              ],
              color: AppColors.akcent,
              borderRadius: BorderRadius.only(
                topRight: _borrderRadiusAnimation.value,
                bottomLeft: _borrderRadiusAnimation.value,
                topLeft: _reverseBorrderRadiusAnimation.value,
                bottomRight: _reverseBorrderRadiusAnimation.value,
              ),
            ),
            child: AuthFormContent(
              isLoginState: _isLoginState,
              toSwitchState: _swichForm,
              formState: _formKey.currentState,
            ),
          );
        },
      ),
    );
  }
}
