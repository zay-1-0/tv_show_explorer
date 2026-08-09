import 'package:flutter/material.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';

/// A show image with a graceful degradation chain: [url], then [fallbackUrl],
/// then a neutral placeholder tile.
///
/// TVMaze publishes only two sizes and the small one is too soft to fill a
/// full-width surface, so callers pass the large URL and set [cacheWidth] to
/// cap the decode — without it each frame would hold a multi-megabyte bitmap.
class PosterView extends StatelessWidget {
  final String url;
  final String? fallbackUrl;
  final int? cacheWidth;

  const PosterView({
    super.key,
    required this.url,
    this.fallbackUrl,
    this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return fallbackUrl == null || fallbackUrl!.isEmpty
          ? const _Placeholder()
          : _image(fallbackUrl!);
    }

    return _image(
      url,
      // Only the primary URL is the large upload worth capping; the fallback
      // is already a thumbnail, and a targetWidth above its intrinsic size
      // would upscale the decode for nothing.
      cap: cacheWidth,
      onError: (fallbackUrl == null || fallbackUrl!.isEmpty || fallbackUrl == url)
          ? null
          : () => _image(fallbackUrl!),
    );
  }

  Widget _image(String source, {int? cap, Widget Function()? onError}) {
    return Image.network(
      source,
      fit: BoxFit.cover,
      cacheWidth: cap,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const ColoredBox(color: AppColors.imagePlaceholder);
      },
      errorBuilder: (context, exception, stackTrace) =>
          onError == null ? const _Placeholder() : onError(),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.imagePlaceholder,
      child: Center(
        child: Icon(
          Icons.tv_off_rounded,
          color: AppColors.divider,
          size: 48,
        ),
      ),
    );
  }
}

/// Bottom-up dark gradient that keeps text legible over a bright poster.
class PosterScrim extends StatelessWidget {
  const PosterScrim({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [
            Color(0xd9000000),
            Color(0x73000000),
            Color(0x00000000),
          ],
        ),
      ),
    );
  }
}
