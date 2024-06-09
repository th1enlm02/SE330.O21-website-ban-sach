import React from "react";
const UserContext = React.createContext({ id:"", userName: "", auth: false });

// @function  UserProvider
// Create function to provide UserContext
// eslint-disable-next-line react/prop-types
const UserProvider = ({ children }) => {
  const [user, setUser] = React.useState(
    sessionStorage.getItem("user")
      ? JSON.parse(sessionStorage.getItem("user"))
      : { id:"", userName: "", email: "", auth: false }
  );

  const login = (user) => {
    setUser({
      id:user.id,
      userName: user.username,
      email: user.email,
      auth: true,
    });
    sessionStorage.setItem("user", JSON.stringify({ id:user.id, userName: user.username, email: user.email, auth: true }));
  };

  const logout = () => {
    sessionStorage.removeItem("user");
    setUser(() => ({
      id: "",
      userName: "",
      email: "",
      auth: false,
    }));
  };

  return (
    <UserContext.Provider value={{ user, login, logout }}>
      {children}
    </UserContext.Provider>
  );
};

export { UserContext, UserProvider };
