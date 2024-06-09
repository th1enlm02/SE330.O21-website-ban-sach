import React, { memo, useEffect, useRef } from 'react';

const ChatBot = memo(() => {
    const scriptRef = useRef(null);

    useEffect(() => {
        if (!scriptRef.current) {
            const chatbot_e = document.createElement("script");
            chatbot_e.src = "https://sf-cdn.coze.com/obj/unpkg-va/flow-platform/chat-app-sdk/0.1.0-beta.2/libs/oversea/index.js";
            chatbot_e.async = true;
            chatbot_e.onload = () => {
                new CozeWebSDK.WebChatClient({
                    config: {
                        bot_id: "7375549987277242376",
                    },
                    componentProps: {
                        title: "ChatBot hỗ trợ",
                    },
                });
            };

            document.body.appendChild(chatbot_e);
            scriptRef.current = chatbot_e;
        }

        return () => {
            if (scriptRef.current) {
                document.body.removeChild(scriptRef.current);
                scriptRef.current = null;
            }
        };
    }, []);

    return (
        <div id="chatbot-container">
        </div>
    );
});

export default ChatBot;
