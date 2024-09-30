import 'package:flutter/material.dart';

class AppTheme {
  final Color? appBarColor;
  final Color? backArrowColor;
  final Color? backgroundColor;
  final Color? replyDialogColor;
  final Color? replyTitleColor;
  final Color? textFieldBackgroundColor;

  final Color? outgoingChatBubbleColor;

  final Color? inComingChatBubbleColor;

  final Color? inComingChatBubbleTextColor;
  final Color? repliedMessageColor;
  final Color? repliedTitleTextColor;
  final Color? textFieldTextColor;

  final Color? closeIconColor;
  final Color? shareIconBackgroundColor;

  final Color? sendButtonColor;
  final Color? cameraIconColor;
  final Color? galleryIconColor;
  final Color? recordIconColor;
  final Color? stopIconColor;
  final Color? swipeToReplyIconColor;
  final Color? replyMessageColor;
  final Color? appBarTitleTextStyle;
  final Color? messageReactionBackGroundColor;
  final Color? messageTimeIconColor;
  final Color? messageTimeTextColor;
  final Color? reactionPopupColor;
  final Color? replyPopupColor;
  final Color? replyPopupButtonColor;
  final Color? replyPopupTopBorderColor;
  final Color? reactionPopupTitleColor;
  final Color? flashingCircleDarkColor;
  final Color? flashingCircleBrightColor;
  final Color? waveformBackgroundColor;
  final Color? waveColor;
  final Color? replyMicIconColor;
  final Color? messageReactionBorderColor;

  final Color? verticalBarColor;
  final Color? chatHeaderColor;
  final Color? themeIconColor;
  final Color? shareIconColor;
  final double? elevation;
  final Color? linkPreviewIncomingChatColor;
  final Color? linkPreviewOutgoingChatColor;
  final TextStyle? linkPreviewIncomingTitleStyle;
  final TextStyle? linkPreviewOutgoingTitleStyle;
  final TextStyle? incomingChatLinkTitleStyle;
  final TextStyle? outgoingChatLinkTitleStyle;
  final TextStyle? outgoingChatLinkBodyStyle;
  final TextStyle? incomingChatLinkBodyStyle;

  AppTheme({
    this.cameraIconColor,
    this.galleryIconColor,
    this.flashingCircleDarkColor,
    this.flashingCircleBrightColor,
    this.outgoingChatLinkBodyStyle,
    this.incomingChatLinkBodyStyle,
    this.incomingChatLinkTitleStyle,
    this.outgoingChatLinkTitleStyle,
    this.linkPreviewOutgoingChatColor,
    this.linkPreviewIncomingChatColor,
    this.linkPreviewIncomingTitleStyle,
    this.linkPreviewOutgoingTitleStyle,
    this.repliedTitleTextColor,
    this.swipeToReplyIconColor,
    this.textFieldTextColor,
    this.reactionPopupColor,
    this.replyPopupButtonColor,
    this.replyPopupTopBorderColor,
    this.reactionPopupTitleColor,
    this.appBarColor,
    this.backArrowColor,
    this.backgroundColor,
    this.replyDialogColor,
    this.replyTitleColor,
    this.textFieldBackgroundColor,
    this.outgoingChatBubbleColor,
    this.inComingChatBubbleColor,
    this.inComingChatBubbleTextColor,
    this.repliedMessageColor,
    this.closeIconColor,
    this.shareIconBackgroundColor,
    this.sendButtonColor,
    this.replyMessageColor,
    this.appBarTitleTextStyle,
    this.messageReactionBackGroundColor,
    this.messageReactionBorderColor,
    this.verticalBarColor,
    this.chatHeaderColor,
    this.themeIconColor,
    this.shareIconColor,
    this.elevation,
    this.messageTimeIconColor,
    this.messageTimeTextColor,
    this.replyPopupColor,
    this.recordIconColor,
    this.stopIconColor,
    this.waveformBackgroundColor,
    this.waveColor,
    this.replyMicIconColor,
  });
}

class LightTheme extends AppTheme {
  LightTheme({
    super.flashingCircleDarkColor,
    super.flashingCircleBrightColor,
    super.incomingChatLinkTitleStyle,
    super.outgoingChatLinkTitleStyle,
    super.outgoingChatLinkBodyStyle,
    super.incomingChatLinkBodyStyle,
    super.textFieldTextColor,
    super.repliedTitleTextColor,
    super.swipeToReplyIconColor,
    super.elevation,
    required ColorScheme colorScheme,
  }) : super(
          reactionPopupColor: colorScheme.surface,
          closeIconColor: colorScheme.onSurface,
          verticalBarColor: colorScheme.primary,
          textFieldBackgroundColor: colorScheme.surface,
          replyTitleColor: colorScheme.primary,
          replyDialogColor: colorScheme.surface,
          backgroundColor: colorScheme.background,
          appBarColor: colorScheme.surface,
          appBarTitleTextStyle: colorScheme.onSurface,
          backArrowColor: colorScheme.primary,
          chatHeaderColor: colorScheme.onBackground,
          inComingChatBubbleColor: colorScheme.surfaceVariant,
          inComingChatBubbleTextColor: colorScheme.onSurfaceVariant,
          messageReactionBackGroundColor: colorScheme.surface,
          messageReactionBorderColor: colorScheme.outline,
          outgoingChatBubbleColor: colorScheme.primary,
          repliedMessageColor: colorScheme.primary.withOpacity(0.2),
          replyMessageColor: colorScheme.onSurface,
          sendButtonColor: colorScheme.primary,
          shareIconBackgroundColor: colorScheme.surfaceVariant,
          themeIconColor: colorScheme.onSurface,
          shareIconColor: colorScheme.onSurfaceVariant,
          messageTimeIconColor: colorScheme.onSurfaceVariant,
          messageTimeTextColor: colorScheme.onSurfaceVariant,
          stopIconColor: colorScheme.onSurface,
          waveformBackgroundColor: colorScheme.surface,
          waveColor: colorScheme.primary,
          replyMicIconColor: colorScheme.onSurface,
        );
}
