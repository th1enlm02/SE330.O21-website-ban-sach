import Header from './components/Header/Header';
import Footer from './components/Footer/Footer';
import PropTypes from 'prop-types';
import { Outlet } from 'react-router-dom';

function UserLayout({ children }) {
  return (
    <div className="flex flex-col min-h-screen">
      <Header />
      {/* {children} */}
      <Outlet />
      <Footer />
    </div>
  );
}

UserLayout.propTypes = {
  children: PropTypes.node.isRequired,
};

export default UserLayout;
