import 'package:dao/assets/logo_svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/screens/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Splash extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _SplashScreen();
  }

  @override
  String get routeName => 'splash';

  @override
  String get routePath => '/';
}

class _SplashScreen extends HookConsumerWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useScreenSize();

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 777)).then((_) {
        GoRouter.of(context).go(Player().routePath);
      });
      return null;
    }, []);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.string(
                logoSvg,
                width: size.width / 3,
                colorFilter: ColorFilter.mode(
                  AppColor.newYorkPink.value,
                  BlendMode.modulate,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: SvgPicture.string(
                '''<svg width="376" height="47" viewBox="0 0 376 47" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M2.44525 46C1.97592 46 1.59192 45.8507 1.29325 45.552C1.03725 45.2107 0.951917 44.8053 1.03725 44.336L9.86925 2.864C9.95458 2.39466 10.1893 2.01066 10.5733 1.712C10.9999 1.37066 11.4479 1.2 11.9173 1.2H28.2373C30.9679 1.2 33.5279 1.584 35.9173 2.352C38.3493 3.12 40.4399 4.25067 42.1893 5.744C43.9386 7.19467 45.1973 9.008 45.9653 11.184C46.7759 13.36 46.9253 15.8773 46.4133 18.736C46.1146 20.5707 45.8159 22.192 45.5173 23.6C45.2186 25.008 44.8346 26.608 44.3653 28.4C43.3413 32.4107 41.8906 35.7173 40.0133 38.32C38.1359 40.9227 35.6826 42.864 32.6533 44.144C29.6666 45.3813 25.9333 46 21.4533 46H2.44525ZM16.7812 35.12H22.2213C23.6293 35.12 24.8666 34.8853 25.9333 34.416C27.0426 33.9467 27.9599 33.2213 28.6853 32.24C29.4533 31.216 30.0293 29.9147 30.4133 28.336C30.7546 27.0987 31.0319 25.9893 31.2453 25.008C31.4586 24.0267 31.6506 23.0453 31.8213 22.064C32.0346 21.0827 32.2479 19.9947 32.4613 18.8C32.8453 16.4533 32.5253 14.7467 31.5013 13.68C30.5199 12.6133 28.9626 12.08 26.8293 12.08H21.7093L16.7812 35.12ZM44.9772 46C44.5079 46 44.1666 45.808 43.9532 45.424C43.7399 44.9973 43.7612 44.5707 44.0172 44.144L67.3133 3.184C67.5693 2.71467 67.9533 2.26667 68.4653 1.84C68.9773 1.41333 69.6386 1.2 70.4493 1.2H82.4813C83.2919 1.2 83.8679 1.41333 84.2093 1.84C84.5506 2.26667 84.7426 2.71467 84.7853 3.184L90.7373 44.144C90.8226 44.6987 90.6733 45.1467 90.2893 45.488C89.9479 45.8293 89.5426 46 89.0733 46H79.4733C78.7479 46 78.2359 45.8293 77.9373 45.488C77.6813 45.1467 77.5106 44.8053 77.4253 44.464L76.5293 39.152H61.1693L57.9693 44.528C57.7986 44.8693 57.4999 45.2107 57.0733 45.552C56.6893 45.8507 56.1346 46 55.4093 46H44.9772ZM66.3533 28.336H75.8893L74.2253 13.936L66.3533 28.336ZM114.943 46.64C112.169 46.64 109.588 46.2773 107.199 45.552C104.809 44.8267 102.761 43.7387 101.055 42.288C99.3481 40.8373 98.1108 39.0453 97.3428 36.912C96.6174 34.736 96.5108 32.1973 97.0228 29.296C97.3214 27.504 97.6628 25.6693 98.0468 23.792C98.4734 21.872 98.9001 19.9733 99.3268 18.096C100.735 12.464 103.295 8.13333 107.007 5.104C110.761 2.07466 115.924 0.559998 122.495 0.559998C125.268 0.559998 127.849 0.943998 130.239 1.712C132.628 2.48 134.655 3.61066 136.319 5.104C138.025 6.55466 139.263 8.38933 140.031 10.608C140.799 12.784 140.927 15.28 140.415 18.096C140.116 19.9733 139.753 21.872 139.327 23.792C138.943 25.6693 138.516 27.504 138.047 29.296C136.596 35.056 134.015 39.3867 130.303 42.288C126.591 45.1893 121.471 46.64 114.943 46.64ZM116.095 35.76C117.929 35.76 119.529 35.2267 120.895 34.16C122.303 33.0507 123.284 31.3013 123.839 28.912C124.308 27.0773 124.735 25.3067 125.119 23.6C125.503 21.8507 125.844 20.08 126.143 18.288C126.569 15.8987 126.335 14.1707 125.439 13.104C124.585 11.9947 123.241 11.44 121.407 11.44C119.572 11.44 117.972 11.9947 116.607 13.104C115.241 14.1707 114.239 15.8987 113.599 18.288C113.172 20.08 112.767 21.8507 112.383 23.6C112.041 25.3067 111.7 27.0773 111.359 28.912C110.932 31.3013 111.145 33.0507 111.999 34.16C112.852 35.2267 114.217 35.76 116.095 35.76ZM161.507 46.64C158.605 46.64 155.939 46.2987 153.507 45.616C151.075 44.8907 149.005 43.824 147.299 42.416C145.635 40.9653 144.461 39.152 143.779 36.976C143.096 34.8 142.989 32.24 143.459 29.296C143.757 27.5467 144.12 25.6693 144.547 23.664C145.016 21.6587 145.464 19.7387 145.891 17.904C146.915 14.064 148.451 10.864 150.499 8.304C152.547 5.70133 155.107 3.76 158.179 2.48C161.293 1.2 164.92 0.559998 169.059 0.559998C171.704 0.559998 174.243 0.901332 176.675 1.584C179.107 2.224 181.219 3.20533 183.011 4.528C184.845 5.85066 186.189 7.51466 187.043 9.52C187.896 11.4827 188.067 13.808 187.555 16.496C187.469 16.88 187.256 17.2 186.915 17.456C186.616 17.712 186.275 17.84 185.891 17.84H175.011C174.413 17.84 173.965 17.712 173.667 17.456C173.411 17.2 173.24 16.752 173.155 16.112C173.112 14.32 172.6 13.104 171.619 12.464C170.68 11.7813 169.443 11.44 167.907 11.44C166.029 11.44 164.408 11.952 163.043 12.976C161.72 13.9573 160.76 15.7067 160.163 18.224C159.267 21.7227 158.499 25.3067 157.859 28.976C157.389 31.4933 157.581 33.264 158.435 34.288C159.331 35.2693 160.717 35.76 162.595 35.76C164.131 35.76 165.517 35.4187 166.755 34.736C168.035 34.0533 169.101 32.8373 169.955 31.088C170.296 30.4053 170.637 29.9573 170.979 29.744C171.363 29.488 171.875 29.36 172.515 29.36H183.395C183.779 29.36 184.077 29.488 184.291 29.744C184.547 30 184.632 30.32 184.547 30.704C183.864 33.3493 182.84 35.6747 181.475 37.68C180.152 39.6427 178.488 41.3067 176.483 42.672C174.477 43.9947 172.216 44.9973 169.699 45.68C167.181 46.32 164.451 46.64 161.507 46.64ZM188.695 46C188.226 46 187.842 45.8507 187.543 45.552C187.287 45.2533 187.202 44.848 187.287 44.336L196.119 2.864C196.205 2.39466 196.439 2.01066 196.823 1.712C197.25 1.37066 197.698 1.2 198.167 1.2H208.535C209.005 1.2 209.367 1.37066 209.623 1.712C209.879 2.01066 209.965 2.39466 209.879 2.864L206.807 17.328H219.863L222.935 2.864C223.021 2.39466 223.255 2.01066 223.639 1.712C224.066 1.37066 224.493 1.2 224.919 1.2H235.351C235.821 1.2 236.183 1.37066 236.439 1.712C236.695 2.01066 236.781 2.39466 236.695 2.864L227.863 44.336C227.778 44.8053 227.543 45.2107 227.159 45.552C226.775 45.8507 226.349 46 225.879 46H215.447C215.021 46 214.658 45.8507 214.359 45.552C214.103 45.2107 214.018 44.8053 214.103 44.336L217.303 29.488H204.247L201.047 44.336C200.962 44.8053 200.727 45.2107 200.343 45.552C199.959 45.8507 199.533 46 199.063 46H188.695ZM233.227 46C232.758 46 232.417 45.808 232.203 45.424C231.99 44.9973 232.011 44.5707 232.267 44.144L255.563 3.184C255.819 2.71467 256.203 2.26667 256.715 1.84C257.227 1.41333 257.889 1.2 258.699 1.2H270.731C271.542 1.2 272.118 1.41333 272.459 1.84C272.801 2.26667 272.993 2.71467 273.035 3.184L278.987 44.144C279.073 44.6987 278.923 45.1467 278.539 45.488C278.198 45.8293 277.793 46 277.323 46H267.723C266.998 46 266.486 45.8293 266.187 45.488C265.931 45.1467 265.761 44.8053 265.675 44.464L264.779 39.152H249.419L246.219 44.528C246.049 44.8693 245.75 45.2107 245.323 45.552C244.939 45.8507 244.385 46 243.659 46H233.227ZM254.603 28.336H264.139L262.475 13.936L254.603 28.336ZM284.633 46C284.163 46 283.779 45.8507 283.481 45.552C283.225 45.2107 283.139 44.8053 283.225 44.336L292.057 2.864C292.142 2.39466 292.377 2.01066 292.761 1.712C293.187 1.37066 293.614 1.2 294.041 1.2H302.553C303.321 1.2 303.833 1.37066 304.089 1.712C304.387 2.05333 304.558 2.33067 304.601 2.544L313.433 23.792L317.849 2.864C317.934 2.39466 318.169 2.01066 318.553 1.712C318.937 1.37066 319.363 1.2 319.833 1.2H329.497C329.966 1.2 330.329 1.37066 330.585 1.712C330.841 2.01066 330.926 2.39466 330.841 2.864L322.009 44.336C321.923 44.8053 321.689 45.2107 321.305 45.552C320.921 45.8507 320.494 46 320.025 46H311.577C310.766 46 310.211 45.8293 309.913 45.488C309.657 45.104 309.486 44.8267 309.401 44.656L300.441 24.56L296.217 44.336C296.131 44.8053 295.897 45.2107 295.513 45.552C295.129 45.8507 294.702 46 294.233 46H284.633ZM341.05 46C340.623 46 340.26 45.8507 339.962 45.552C339.706 45.2107 339.62 44.8053 339.706 44.336L346.426 13.104H335.418C334.948 13.104 334.564 12.9547 334.266 12.656C334.01 12.3147 333.924 11.9093 334.01 11.44L335.866 2.864C335.951 2.39466 336.186 2.01066 336.57 1.712C336.996 1.37066 337.423 1.2 337.85 1.2H373.818C374.287 1.2 374.65 1.37066 374.906 1.712C375.204 2.01066 375.311 2.39466 375.226 2.864L373.37 11.44C373.284 11.9093 373.05 12.3147 372.666 12.656C372.282 12.9547 371.855 13.104 371.386 13.104H360.378L353.658 44.336C353.572 44.8053 353.338 45.2107 352.954 45.552C352.57 45.8507 352.143 46 351.674 46H341.05Z" fill="#3A6351"/>
</svg>''',
                width: size.width / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
