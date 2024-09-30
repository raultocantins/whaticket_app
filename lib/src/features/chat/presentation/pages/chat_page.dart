import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:whaticket_app/src/core/utils/chat_theme.dart';
import 'package:whaticket_app/src/data.dart';

class ChatPage extends StatefulWidget {
  final String id;
  final String title;
  final String profileUrl;
  const ChatPage(
      {required this.id,
      required this.title,
      required this.profileUrl,
      super.key});

  @override
  State<ChatPage> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPage> {
  final _chatController = ChatController(
    initialMessageList: Data.messageList,
    scrollController: ScrollController(),
    currentUser: ChatUser(
      id: '1',
      name: 'Alex raul',
      profilePhoto: Data.profileImage,
    ),
    otherUsers: [],
  );

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  void receiveMessage() async {
    _chatController.addMessage(
      Message(
        id: DateTime.now().toString(),
        message: 'I will schedule the meeting.',
        createdAt: DateTime.now(),
        sentBy: '2',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    _chatController.addReplySuggestions([
      const SuggestionItemData(text: 'Thanks.'),
      const SuggestionItemData(text: 'Thank you very much.'),
      const SuggestionItemData(text: 'Great.')
    ]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatView(
        chatController: _chatController,
        onSendTap: _onSendTap,
        featureActiveConfig: const FeatureActiveConfig(
          lastSeenAgoBuilderVisibility: true,
          receiptsBuilderVisibility: true,
          enableScrollToBottomButton: true,
        ),
        scrollToBottomButtonConfig: ScrollToBottomButtonConfig(
          backgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .textFieldBackgroundColor,
          border: Border.all(
            color: Colors.grey,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                .themeIconColor,
            weight: 10,
            size: 30,
          ),
        ),
        chatViewState: ChatViewState.hasMessages,
        chatViewStateConfig: ChatViewStateConfiguration(
          loadingWidgetConfig: ChatViewStateWidgetConfiguration(
            loadingIndicatorColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .outgoingChatBubbleColor,
          ),
          onReloadButtonTap: () {},
        ),
        typeIndicatorConfig: TypeIndicatorConfiguration(
          flashingCircleBrightColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .flashingCircleBrightColor,
          flashingCircleDarkColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .flashingCircleDarkColor,
        ),
        appBar: ChatViewAppBar(
          elevation: 0,
          backGroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .appBarColor,
          profilePicture: widget.profileUrl,
          backArrowColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
              .backArrowColor,
          chatTitle: widget.title,
          chatTitleTextStyle: TextStyle(
            color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                .appBarTitleTextStyle,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.25,
          ),
          userStatus: "online",
          userStatusTextStyle: const TextStyle(color: Colors.grey),
        ),
        chatBackgroundConfig: ChatBackgroundConfiguration(
          messageTimeIconColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .messageTimeIconColor,
          messageTimeTextStyle: TextStyle(
              color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .messageTimeTextColor),
          defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
            textStyle: TextStyle(
              color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .chatHeaderColor,
              fontSize: 17,
            ),
          ),
          backgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .backgroundColor,
        ),
        sendMessageConfig: SendMessageConfiguration(
          imagePickerIconsConfig: ImagePickerIconsConfiguration(
            cameraIconColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .cameraIconColor,
            galleryIconColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .galleryIconColor,
          ),
          replyMessageColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .replyMessageColor,
          defaultSendButtonColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .sendButtonColor,
          replyDialogColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .replyDialogColor,
          replyTitleColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .replyTitleColor,
          textFieldBackgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .textFieldBackgroundColor,
          closeIconColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
              .closeIconColor,
          textFieldConfig: TextFieldConfiguration(
            onMessageTyping: (status) {
              /// Do with status
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .textFieldTextColor),
          ),
          micIconColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
              .replyMicIconColor,
          voiceRecordingConfiguration: VoiceRecordingConfiguration(
            backgroundColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .waveformBackgroundColor,
            recorderIconColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .recordIconColor,
            waveStyle: WaveStyle(
              showMiddleLine: false,
              waveColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .waveColor ??
                  Colors.white,
              extendWaveform: true,
            ),
          ),
        ),
        chatBubbleConfig: ChatBubbleConfiguration(
          outgoingChatBubbleConfig: ChatBubble(
            linkPreviewConfig: LinkPreviewConfiguration(
              backgroundColor:
                  LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .linkPreviewOutgoingChatColor,
              bodyStyle: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .outgoingChatLinkBodyStyle,
              titleStyle: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .outgoingChatLinkTitleStyle,
            ),
            receiptsWidgetConfig:
                const ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
            color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                .outgoingChatBubbleColor,
          ),
          inComingChatBubbleConfig: ChatBubble(
            linkPreviewConfig: LinkPreviewConfiguration(
              linkStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor,
                decoration: TextDecoration.underline,
              ),
              backgroundColor:
                  LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .linkPreviewIncomingChatColor,
              bodyStyle: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .incomingChatLinkBodyStyle,
              titleStyle: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .incomingChatLinkTitleStyle,
            ),
            textStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor),
            onMessageRead: (message) {
              /// send your message reciepts to the other client
              debugPrint('Message Read');
            },
            senderNameTextStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor),
            color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                .inComingChatBubbleColor,
          ),
        ),
        replyPopupConfig: ReplyPopupConfiguration(
          backgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .replyPopupColor,
          buttonTextStyle: TextStyle(
              color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .replyPopupButtonColor),
          topBorderColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
              .replyPopupTopBorderColor,
        ),
        reactionPopupConfig: ReactionPopupConfiguration(
          shadow: BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 20,
          ),
          backgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .reactionPopupColor,
        ),
        messageConfig: MessageConfiguration(
          messageReactionConfig: MessageReactionConfiguration(
            backgroundColor:
                LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .messageReactionBackGroundColor,
            borderColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
                .messageReactionBackGroundColor,
            reactedUserCountTextStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor),
            reactionCountTextStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor),
            reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
              backgroundColor:
                  LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .backgroundColor,
              reactedUserTextStyle: TextStyle(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleTextColor,
              ),
              reactionWidgetDecoration: BoxDecoration(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                    .inComingChatBubbleColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 20),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          imageMessageConfig: ImageMessageConfiguration(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            shareIconConfig: ShareIconConfiguration(
              defaultIconBackgroundColor:
                  LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .shareIconBackgroundColor,
              defaultIconColor:
                  LightTheme(colorScheme: Theme.of(context).colorScheme)
                      .shareIconColor,
            ),
          ),
        ),
        profileCircleConfig: const ProfileCircleConfiguration(
          profileImageUrl: Data.profileImage,
        ),
        repliedMessageConfig: RepliedMessageConfiguration(
          backgroundColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .repliedMessageColor,
          verticalBarColor:
              LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .verticalBarColor,
          repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
            enableHighlightRepliedMsg: true,
            highlightColor: Colors.pinkAccent.shade100,
            highlightScale: 1.1,
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
          replyTitleTextStyle: TextStyle(
              color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .repliedTitleTextColor),
        ),
        swipeToReplyConfig: SwipeToReplyConfiguration(
          replyIconColor: LightTheme(colorScheme: Theme.of(context).colorScheme)
              .swipeToReplyIconColor,
        ),
        replySuggestionsConfig: ReplySuggestionsConfig(
          itemConfig: SuggestionItemConfig(
            decoration: BoxDecoration(
              color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                  .textFieldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: LightTheme(colorScheme: Theme.of(context).colorScheme)
                        .outgoingChatBubbleColor ??
                    Colors.white,
              ),
            ),
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
          onTap: (item) =>
              _onSendTap(item.text, const ReplyMessage(), MessageType.text),
        ),
      ),
    );
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    _chatController.addMessage(
      Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        message: message,
        sentBy: _chatController.currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }
}
